package main

import (
	// "flag"
	"fmt"
	"log"
	"regexp"
	"strings"
	// "time"

	"database/sql"
	"github.com/fiorix/go-eventsocket/eventsocket"
	_ "github.com/lib/pq"
)

type Session struct {
	c                    *eventsocket.Connection
	subnum               string
	subnum_type          string
	rec_file             string
	caller_id_number     string
	callername           string
	call_direction       string // 呼叫方向
	inbound_uuid         string
	destination_number   string
	secretary_jobid      string
	secretary_uuid       string
	custom_number        string //客户号码
	custom_number_type   string //客户号码类型(本地手机/本地固话/外地手机/外地固话)
	custom_number_status string //客户号码状态(未知/合作/勿扰/黑名单/异常)
	office_number        string //办公固话
	office_number_type   string //办公固话类型(湖南好搜/湖南正翔汇/湖南周边云...)
	sdp                  string
}

const (
	// audioFile = "/home/zhou/bin/hold_music.wav"
	VERSION = "1.0_20150425"
	WAIT    = "/home/zhou/bin/eventsocket/wait.wav"
	MOBILE  = "^(1[34578][0-9])\\d{8}$"
	PHONE   = "^([01]\\d{9}\\d?)|(400\\d{7})|([235678]\\d{7})$"
)

var (
	err  error
	db   *sql.DB
	dsn  = `postgres://rec360:(rec360)@127.0.0.1:5432/cdr?sslmode=disable`
	port = ":9090"
)

func validate(mobileNum string, regular string) bool {
	reg := regexp.MustCompile(regular)
	return reg.MatchString(mobileNum)
}

func clearNum(number string) string {
	// '''号码去非数字字符，手机号码去0'''
	fnumber := strings.Join(regexp.MustCompile(`\d+`).FindAllString(number, -1), "")
	if (fnumber[0:2] == "01") && (fnumber[0:3] != "010") { // 带0且非北京固话
		fnumber = fnumber[1:] //去0
	}
	return fnumber
}

func main() {
	fmt.Println("*** Started")
	eventsocket.ListenAndServe(port, outboundHandler)
	fmt.Println("*** Finished")

}

func outboundHandler(c *eventsocket.Connection) {

	fmt.Println("new client:", c.RemoteAddr())
	s := Session{}
	s.c = c

	ev, err := c.Send("connect")
	if err != nil {
		fmt.Println("ERROR: ", err)
		return
	}
	defer s.c.Close()

	s.caller_id_number = ev.Get("Channel-Caller-Id-Number")
	s.callername = ev.Get("Channel-Caller-Id-Name")
	s.destination_number = ev.Get("Channel-Destination-Number")
	s.inbound_uuid = ev.Get("Channel-Unique-Id")

	// 限制pjsip类软件拨出
	s.sdp = ev.Get("Variable_switch_r_sdp")
	// fmt.Println("sdp:", s.sdp)
	if strings.Contains(s.sdp, "pjmedia") {
		fmt.Println("MicroSIP 禁止呼出!")
		s.c.Execute("transfer", "hangup_calls", false)
		return
	}

	if !validate(s.destination_number, PHONE) { //是否电话号码
		fmt.Println("号码格式错误", s.destination_number)
		s.c.Execute("transfer", "hangup_calls", false)
		return
	}

	//数据库连接
	db, err := sql.Open("postgres", dsn)
	if err != nil {
		fmt.Println("数据库连接失败！", err)
		s.c.Execute("transfer", "hangup_calls", false)
		return
	}
	defer db.Close()

	// 根据主被叫确定办公电话，客户电话，客户电话状态和分机号码
	s.office_number_type = "湖南好搜"
	s.custom_number_status = "未知"
	s.subnum = s.callername
	s.custom_number = s.destination_number
	s.office_number = "82088888"
	// var office_number string
	err = db.QueryRow("select officephone from users where subnum=$1", s.subnum).Scan(&s.office_number) //获得办公固话号码
	if err != nil {
		fmt.Println("查询办公固话失败：", err)
		// s.c.Execute("transfer", "hangup_calls", false)
		// return
	}
	// 确定分机所属部门及客户电话状态
	// is_seller := false
	// err = db.QueryRow("select exist(groups,'sellers') from users where subnum=$1", s.subnum).Scan(&is_seller)
	// if err != nil {
	//	fmt.Println("查询判断是否销售失败：", err)
	//	s.c.Execute("transfer", "hangup_calls", false)
	//	return
	// }
	// if is_seller {
	//	s.subnum_type = "销售"
	//	num_in_filter := 0
	//	err = db.QueryRow("select count(id) from filter where phone_number=$1", s.custom_number).Scan(&num_in_filter)
	//	if err != nil {
	//		fmt.Println("查询判断用户是否在过滤表失败：", err)
	//		s.c.Execute("transfer", "hangup_calls", false)
	//		return
	//	}
	//	if num_in_filter > 0 {
	//		var is_custom, is_bother, is_warning int
	//		err = db.QueryRow("select custom, bother, warning from filter where phone_number=$1", s.custom_number).Scan(&is_custom, &is_bother, &is_warning)
	//		if err != nil {
	//			fmt.Println("查询被叫过滤状态失败：", err)
	//			s.c.Execute("transfer", "hangup_calls", false)
	//			return
	//		}
	//		if is_custom == 1 {
	//			s.custom_number_status = "custom"
	//			// fmt.Println("销售电话类型:", "custom")
	//		} else if is_warning == 1 {
	//			s.custom_number_status = "warning"
	//			// fmt.Println("销售电话类型:", "warning")
	//		} else if is_bother == 1 {
	//			s.custom_number_status = "bother"
	//			// fmt.Println("销售电话类型:", "bother")
	//		}
	//	} // else {
	//	//	fmt.Println("销售电话类型:", "添加过滤")
	//	// }

	// }

	// 确定客户电话类型
	s.custom_number = clearNum(s.custom_number)
	if validate(s.custom_number, MOBILE) { //是否手机号码
		local_number := 0
		err = db.QueryRow("select count(id) from hdata_new where area_code='0731' and hnum=$1", s.custom_number[0:7]).Scan(&local_number)
		if err != nil {
			fmt.Println("查询是否本地手机失败：", err)
			s.c.Execute("transfer", "hangup_calls", false)
			return
		}
		if local_number > 0 {
			s.custom_number_type = "本地手机"
		} else {
			s.custom_number_type = "外地手机"
			s.custom_number = "0" + s.custom_number //加0
		}

	} else {
		if s.custom_number[0:1] == "0" {
			s.custom_number_type = "外地固话"
		} else {
			s.custom_number_type = "本地固话"
		}
	}

	log.Println("call transfer start")

	// 流程控制
	// 1. 是否分公司/客户号码，送到相应网关
	// 2. 是否不识别的主/被叫号码(用 call_direction="未知" 来表示)
	// 3. 呼出号码处理
	//    3.1 是否销售分机外呼 --> 是否设置了电话号码状态 --> 播放相应提示语音,DTMF按键 --> 挂机
	//    3.2 不满足上述条件，则直接外呼
	// 4. 呼入号码处理
	//    4.1 是否有对应的分机号码 -->（分机是否在线） --> 直接转分机
	//    4.2 不满足上述条件，转前台总机

	// if s.subnum_type == "销售" {
	//	if s.custom_number_status == "warning" || s.custom_number_status == "custom" || s.custom_number_status == "bother" {
	//		// log.Println("销售电话" + s.custom_number_status)
	//		s.c.Execute("transfer", s.office_number+"_"+s.custom_number+"_"+s.custom_number_status, false)
	//	} else {
	//		s.c.Execute("transfer", "dial_out_"+s.office_number+"_"+s.custom_number, false)
	//	}
	// } else {
	//	s.c.Execute("transfer", "dial_out_"+s.office_number+"_"+s.custom_number, false)
	// }
	s.c.Execute("transfer", "dial_out_"+s.office_number+"_"+s.custom_number, false)

	log.Println(s.caller_id_number, "-->", s.destination_number, s.call_direction, " 分机:", s.subnum, ", 办公电话:", s.office_number, ", 电话所属:", s.office_number_type)
}
