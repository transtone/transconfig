package main

import (
	"fmt"
	"log"
	"regexp"
	"strings"
	"time"

	"github.com/fiorix/go-eventsocket/eventsocket"
	"menteslibres.net/gosexy/redis"
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
}

const (
	// audioFile = "/home/zhou/bin/hold_music.wav"
	WAIT   = "/home/zhou/bin/eventsocket/wait.wav"
	MOBILE = "^(1[34578][0-9])\\d{8}$"
)

//redis连接
var r_err error
var host = "192.168.36.36"
var port = uint(6379)
var r *redis.Client

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

//	fmt.Println(strings.Join(regexp.MustCompile(`\d+`).FindAllString(number, -1), "" ))

func main() {
	fmt.Println("*** Started")
	eventsocket.ListenAndServe(":9090", outboundHandler)
	fmt.Println("*** Finished")
}

func outboundHandler(c *eventsocket.Connection) {

	{
		r = redis.New()
		r_err = r.Connect(host, port)
		if r_err != nil {
			log.Fatalf("Connect failed: %s\n", r_err.Error())
		}
		// log.Println("连接redis服务器.")
	}

	fmt.Println("new client:", c.RemoteAddr())

	s := Session{}
	s.c = c

	{
		ev, err := c.Send("connect")
		if err != nil {
			fmt.Println("ERROR: ", err)
			return
		}

		s.caller_id_number = ev.Get("Channel-Caller-Id-Number")
		s.callername = ev.Get("Channel-Caller-Id-Name")
		s.destination_number = ev.Get("Channel-Destination-Number")
		s.inbound_uuid = ev.Get("Channel-Unique-Id")
		// 根据主被叫确定办公电话，客户电话，客户电话状态和分机号码
		s.office_number_type = "湖南好搜"
		s.custom_number_status = "未知"
		if len(s.caller_id_number) == 4 { //主叫4位，内线外呼
			s.call_direction = "呼出"
			s.subnum = s.caller_id_number
			s.custom_number = s.destination_number
			s.office_number, err = r.HGet("rec:"+s.subnum, "phone")
			if err != nil {
				s.office_number = "82088888"
			}
			// 确定分机所属部门及客户电话状态
			if subnum, _ := r.SIsMember("allusers:100", s.subnum); subnum {
				s.subnum_type = "销售"
				if cnum, _ := r.SIsMember("rec:custom", s.custom_number); cnum {
					s.custom_number_status = "custom"
				}
				if cnum, _ := r.SIsMember("rec:warning", s.custom_number); cnum {
					s.custom_number_status = "warning"
				}
				if cnum, _ := r.SIsMember("rec:bother", s.custom_number); cnum {
					s.custom_number_status = "bother"
				}
			}
		} else if len(s.caller_id_number) > 7 { //主叫7位以上号码，1.外线呼入,被叫是好搜; 2.分公司/客户呼入，被叫是客户; 3.外线呼入，被叫是分公司/客户)
			s.call_direction = "呼入"
			s.custom_number = s.caller_id_number
			s.office_number = s.destination_number
			// 确定办公电话类型
			if cnum, _ := r.SIsMember("phone:hnzby", s.caller_id_number); cnum { //主叫电话为周边云号码
				s.call_direction = "呼出"
				s.custom_number = s.destination_number
				s.office_number = s.caller_id_number
				s.office_number_type = "湖南周边云"
			} else if dnum, _ := r.SIsMember("phone:hnzby", s.destination_number); dnum { //被叫电话位周边云号码
				s.office_number_type = "湖南周边云"
			} else {
				s.subnum, err = r.HGet("rec:phone", s.caller_id_number) //通过办公号码找到分机号
				if err != nil {
					s.subnum = "8888"
				}
			}

		} else { //其他异常号码,转前台
			s.call_direction = "未知"
			s.custom_number_status = "异常"
		}

		// 确定客户电话类型
		s.custom_number = clearNum(s.custom_number)
		if validate(s.custom_number, MOBILE) { //是否手机号码
			if cnum, _ := r.SIsMember("phone:hdata:0731", s.custom_number[0:7]); cnum {
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
		r.Quit()
		// log.Println("断开redis服务器.")
	}
	// 录音文件名
	year := time.Now().Format("2006")
	month := time.Now().Format("01")
	day := time.Now().Format("02")
	s.rec_file = fmt.Sprintf("/mnt/stone/%s/%s/%s/%s_%s_%s.wav", year, month, day, s.caller_id_number, s.destination_number, s.inbound_uuid)
	// 流程控制
	// 1. 是否分公司/客户号码，送到相应网关
	// 2. 是否不识别的主/被叫号码(用 call_direction="未知" 来表示)
	// 3. 呼出号码处理
	//    3.1 是否销售分机外呼 --> 是否设置了电话号码状态 --> 播放相应提示语音,DTMF按键 --> 挂机
	//    3.2 不满足上述条件，则直接外呼
	// 4. 呼入号码处理
	//    4.1 是否有对应的分机号码 -->（分机是否在线） --> 直接转分机
	//    4.2 不满足上述条件，转前台总机

	ringback := "ringback=file_string://" + WAIT
	c.Execute("set", ringback, false)
	c.Execute("set", "hangup_after_bridge=true", false)
	// c.Send("linger 5")
	c.Execute("answer", "", true)
	// c.Execute("playback", "local_stream://moh", true)
	cmd := "user/8888@192.168.36.1"
	if s.office_number_type != "湖南好搜" {
		if s.office_number_type == "湖南周边云" {
			callerIDNumber := "effective_caller_id_number=" + s.caller_id_number
			c.Execute("set", callerIDNumber, false)
			if s.call_direction == "呼入" {
				cmd = "sofia/gateway/hnzby/" + s.destination_number
			} else if s.call_direction == "呼出" {
				cmd = "sofia/gateway/serv36/" + s.destination_number
			}
		}
	} else if s.call_direction == "呼出" {
		if s.subnum_type == "销售" {
			if s.custom_number_status == "warning" || s.custom_number_status == "custom" || s.custom_number_status == "bother" {

				log.Println("销售电话")
				sound := "/usr/share/freeswitch/sounds/" + s.custom_number_status + ".wav"
				c.Execute("playback", sound, true)
				// started := time.Now()
				// digit := ""
				c.Execute("hungup", "", true)
				// for time.Since(started).Seconds() < 60 && digit == "" {

				//	ev, err := c.Send("api uuid_exists " + s.inbound_uuid)
				//	if err != nil || ev.Body == "false" {
				//		break
				//	}

				//	digit = playAndGetOneDigit(
				//		sound,
				//		c, s.inbound_uuid)
				// }

				// if digit != "1" {
				//	c.Send("api uuid_break " + s.inbound_uuid)
				//	c.Close()
				//	return
				//	c.Send("api uuid_break " + s.inbound_uuid)
				c.Close()
				return
			}
		}
		c.Execute("set", "RECORD_ANSWER_REQ=true", false)
		c.Execute("record_session", s.rec_file, false)
		callerIDNumber := "effective_caller_id_number=" + s.office_number
		c.Execute("set", callerIDNumber, false)
		cmd = "{ignore_early_media=false}sofia/gateway/serv36/" + s.custom_number
	} else if s.call_direction == "呼入" {
		c.Execute("set", "RECORD_ANSWER_REQ=true", false)
		c.Execute("record_session", s.rec_file, false)
		cmd = "user/" + s.subnum + "@192.168.36.1"
	} else {
		c.Execute("set", "RECORD_ANSWER_REQ=true", false)
		c.Execute("record_session", s.rec_file, false)
	}

	log.Println(s.caller_id_number, "-->", s.destination_number, s.call_direction, " 分机:", s.subnum, ", 办公电话:", s.office_number, ", 电话所属:", s.office_number_type)

	_, err := c.Execute("bridge", cmd, false)
	if err != nil {
		// hup = true
		log.Println("Error calling out: ", err)
	} else {
		// c.Send("api uuid_break " + s.inbound_uuid) //可能有挂断异常的情况，强行挂断。
		c.Send("api uuid_kill " + s.inbound_uuid)
		log.Println(s.caller_id_number, "-->", s.destination_number, "挂断")
	}

	// go secretaryCallOut(&s)

	// c.Execute("playback", "local_stream://moh", true)

	// fmt.Println("playback aborted")

	// normal_clearing := false
	// {
	//	ev, err := c.Send("api uuid_getvar " + s.inbound_uuid +
	//		" hangup_cause")
	//	if err != nil && ev.Body != "" {
	//		normal_clearing = true
	//	}
	// }

	// hup := false

	// if s.secretary_uuid == "" {
	//	hup = true
	// } else {
	//	ev, err := c.Send("api uuid_exists " + s.secretary_uuid)
	//	if err != nil || ev.Body == "false" {
	//		hup = true
	//	} else {
	//		// secretary is running
	//		if normal_clearing {
	//			// abort the secretary
	//			fmt.Println("Aborting the secretary")
	//			c.Send("api uuid_kill " + s.secretary_uuid)
	//		}
	//	}
	// }

	// if hup {
	//	c.Execute("playback", "misc/sorry.wav", true)
	//	c.Execute("sleep", "500", true)
	//	c.Execute("hangup", "", false)
	//	fmt.Println("hup")
	// }

	c.Close()
}

func secretaryCallOut(s *Session) {

	c, err := eventsocket.Dial("192.168.36.1:8021", "ClueCon")
	if err != nil {
		fmt.Println("Failed to connect to FreeSWITCH: ", err)
		s.c.Execute("hangup", "", false)
		return
	}

	var uuid string

	{
		ev, err := c.Send("api create_uuid")
		if err != nil {
			fmt.Println("Failed uuid_create: ", err)
			s.c.Execute("hangup", "", false)
			return
		}

		uuid = ev.Body
	}

	s.secretary_uuid = uuid

	cmd := "api originate " +
		fmt.Sprintf(
			"{ignore_early_media=true,"+
				"origination_uuid=%s,"+
				"originate_timeout=60,origination_caller_id_number=83388585,"+
				"origination_caller_id_name='%s'}sofia/gateway/serv36/18874220005",
			uuid,
			s.callername) +
		" &playback(silence_stream://-1)"

	{
		_, err := c.Send(cmd)
		if err != nil {
			fmt.Println("Error calling out: ", err)
			c.Send("api uuid_break " + s.inbound_uuid)
			return
		}
	}

	started := time.Now()
	digit := ""

	for time.Since(started).Seconds() < 60 && digit == "" {

		ev, err := c.Send("api uuid_exists " + s.secretary_uuid)
		if err != nil || ev.Body == "false" {
			break
		}

		digit = playAndGetOneDigit(
			"ivr/ivr-welcome_to_freeswitch.wav",
			c, s.secretary_uuid)
	}

	if digit == "" || digit == "0" {
		c.Send("api uuid_kill " + s.secretary_uuid)
		c.Send("api uuid_break " + s.inbound_uuid)
	} else {
		fmt.Println("inbond_uuid:" + s.inbound_uuid + " sec_uuid:" + s.secretary_uuid)
		c.Send("api uuid_bridge " + s.inbound_uuid +
			" " + s.secretary_uuid)
	}

	c.Close()
}

func playAndGetOneDigit(
	sound string,
	c *eventsocket.Connection,
	uuid string) string {

	c.Send("filter Unique-ID " + uuid)
	c.Send("event plain CHANNEL_EXECUTE_COMPLETE")

	{
		_, err := c.ExecuteUUID(
			uuid,
			"play_and_get_digits",
			"1 1 1 400 # "+
				sound+" silence_stream://250 result \\d")
		if err != nil {
			fmt.Println("Error executing play_and_get_digits: ",
				err)
			return ""
		}
	}

	finished := false
	ret := ""

	for !finished {

		ev, err := c.ReadEvent()
		if err != nil {
			finished = true
		} else {
			if ev.Get("Event-Name") ==
				"CHANNEL_EXECUTE_COMPLETE" &&
				ev.Get("Application") == "play_and_get_digits" {
				ret = ev.Get("Variable_result")
				finished = true
			}
		}
	}

	c.Send("noevents")
	c.Send("filter delete Unique-ID " + uuid)

	return ret
}
