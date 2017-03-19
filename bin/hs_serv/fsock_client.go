package main

import (
	"database/sql"
	// "flag"
	"fmt"
	"github.com/cgrates/fsock"
	"github.com/garyburd/redigo/redis"
	_ "github.com/go-sql-driver/mysql"
	"log"
	"log/syslog"
	"time"
)

//redis连接
var (
	err         error
	db          *sql.DB
	pool        *redis.Pool
	redisServer = "192.168.36.3:6379"
	// redisPassword = flag.String("", "", "")
)

// type DB struct {
//	db *sql.DB
// }

// func (dbt *DB) fail(method, query string, err error) {
//	if len(query) > 300 {
//		query = "[query too large to print]"
//	}
//	log.Fatalf("Error on %s %s: %s", method, query, err.Error())
// }

// func (dbt *DB) myExec(query string, args ...interface{}) (res sql.Result) {
//	res, err := dbt.db.Exec(query, args...)
//	if err != nil {
//		dbt.fail("Exec", query, err)
//	}
//	return res
// }

// func (dbt *DB) myQuery(query string, args ...interface{}) (rows *sql.Rows) {
//	rows, err := dbt.db.Query(query, args...)
//	if err != nil {
//		dbt.fail("Query", query, err)
//	}
//	return rows

// }

// dbt := &DB{db}
// res := dbt.myExec("INSERT INTO haosoo_call(caller_staffId,destination_number,start_stamp,uuid) VALUES(?,?,?,?)", cname, destination, start, uuid)

// func init() {
//	db, err = sql.Open("mysql", "root:haosoo8888@tcp(127.0.0.1:3306)/call?charset=utf8")
//	if err != nil {
//		log.Fatal(err)
//	}
//	db.SetMaxOpenConns(2000)
//	db.SetMaxIdleConns(1000)
// }

func newPool(server string) *redis.Pool {
	return &redis.Pool{
		MaxIdle:     3,
		IdleTimeout: 240 * time.Second,
		Dial: func() (redis.Conn, error) {
			c, err := redis.Dial("tcp", server)
			if err != nil {
				return nil, err
			}
			return c, err
		},
		TestOnBorrow: func(c redis.Conn, t time.Time) error {
			_, err := c.Do("PING")
			return err
		},
	}
}

// Formats the event as map and prints it out
func printChannelCreate(eventStr string) {
	// Format the event from string into Go's map type
	eventMap := fsock.FSEventStrToMap(eventStr, []string{})
	uuid := eventMap["Channel-Call-UUID"]
	caller := eventMap["Caller-Caller-ID-Number"] // 主叫号码，内部固话号码 office_number
	cname := eventMap["Caller-Caller-ID-Name"]
	destination := eventMap["Caller-Destination-Number"]
	// user := eventMap["Caller-Username"]
	direction := eventMap["variable_direction"]
	// callee := eventMap["Caller-Callee-ID-Number"]
	// 发起呼叫时的几种状况。 (呼入：转发，总台，分机，二次呼叫。 呼出：销售(提示客户，非提示客户)，客服(客户评价)，其他部门)
	if len(cname) == 4 && direction == "inbound" { //外呼
		fmt.Println("Channel-Call-UUID:" + uuid)
		fmt.Println(cname + " / " + caller + " --> " + destination)
		// fmt.Println("Caller-Caller-ID-Number:" + caller)
		fmt.Println("created ")
		start := time.Now().Format("2006-01-02 15:04:05")

		stmt, err := db.Prepare("INSERT INTO haosoo_call(subnum,caller_id_number,destination_number,start_stamp,uuid) VALUES(?,?,?,?,?)")
		if err != nil {
			log.Fatal(err)
		}
		res, err := stmt.Exec(cname, caller, destination, start, uuid)
		if err != nil {
			log.Fatal(err)
		}
		lastId, err := res.LastInsertId()
		if err != nil {
			log.Fatal(err)
		}
		rowCnt, err := res.RowsAffected()
		if err != nil {
			log.Fatal(err)
		}
		log.Printf("ID = %d, affected = %d\n", lastId, rowCnt)

		c := pool.Get()
		// 连接完关闭，其实没有关闭，是放回池里，也就是队列里面，等待下一个重用
		defer c.Close()
		ring := fmt.Sprintf("ring:out,%s,%s,%s", caller, destination, uuid)
		redis.Bool(c.Do("PUBLISH", fmt.Sprintf("channel:%s", cname), ring))
	}
}

func printChannelAnswer(eventStr string) {
	// Format the event from string into Go's map type
	// 应答时的几种状况
	eventMap := fsock.FSEventStrToMap(eventStr, []string{})
	uuid := eventMap["Channel-Call-UUID"]
	caller := eventMap["Caller-Caller-ID-Number"]
	cname := eventMap["Caller-Caller-ID-Name"]
	destination := eventMap["Caller-Destination-Number"]
	direction := eventMap["variable_direction"]
	// callee := eventMap["Caller-Callee-ID-Number"]
	if len(cname) == 4 && len(destination) > 7 && direction == "inbound" {
		// if callee == "" {
		//	callee = destination
		// }
		fmt.Println("Channel-Call-UUID:" + uuid)
		fmt.Println(caller + " --> " + destination + " answered")
		fmt.Println("answered")
		// fmt.Printf("%v", eventMap)

		anwser := time.Now().Format("2006-01-02 15:04:05")
		// var cuuid int
		// db.QueryRow("select count(id) from haosoo_call where uuid=? ", uuid).Scan(&cuuid)

		stmt, err := db.Prepare("update haosoo_call set answer_stamp=? where uuid=?")
		if err != nil {
			log.Fatal(err)
		}
		res, err := stmt.Exec(anwser, uuid)
		if err != nil {
			log.Fatal(err)
		}
		lastId, err := res.LastInsertId()
		if err != nil {
			log.Fatal(err)
		}
		rowCnt, err := res.RowsAffected()
		if err != nil {
			log.Fatal(err)
		}
		log.Printf("ID = %d, affected = %d\n", lastId, rowCnt)

		c := pool.Get()
		// 连接完关闭，其实没有关闭，是放回池里，也就是队列里面，等待下一个重用
		defer c.Close()
		redis.Bool(c.Do("PUBLISH", fmt.Sprintf("channel:%s", cname), "anwsered"))

	}
}

func printChannelHungup(eventStr string) {
	// Format the event from string into Go's map type
	eventMap := fsock.FSEventStrToMap(eventStr, []string{})
	caller := eventMap["Caller-Caller-ID-Number"]
	uuid := eventMap["Channel-Call-UUID"]
	cname := eventMap["Caller-Caller-ID-Name"]
	// destination := eventMap["Caller-Destination-Number"]
	callee := eventMap["Caller-Callee-ID-Number"]
	direction := eventMap["variable_direction"]
	if len(cname) == 4 && direction == "inbound" {
		fmt.Println("Channel-Call-UUID:" + uuid)
		fmt.Println(caller + " --> " + callee + " hangup")
		fmt.Println(" hungup ")

		end := time.Now().Format("2006-01-02 15:04:05")
		year := time.Now().Format("2006")
		month := time.Now().Format("01")
		day := time.Now().Format("02")
		stmt, err := db.Prepare("update haosoo_call set end_stamp=?, billsec=TIMESTAMPDIFF(SECOND,answer_stamp,end_stamp), url= CONCAT('http://rec.haosoo.cn/static/rec2/',?,'/',?,'/',?,'/',?,'_',destination_number,'_',uuid,'.wav' ) where answer_stamp is not null and uuid=?")
		if err != nil {
			log.Fatal(err)
		}
		res, err := stmt.Exec(end, year, month, day, caller, uuid)
		if err != nil {
			log.Fatal(err)
		}
		lastId, err := res.LastInsertId()
		if err != nil {
			log.Fatal(err)
		}
		rowCnt, err := res.RowsAffected()
		if err != nil {
			log.Fatal(err)
		}
		log.Printf("ID = %d, affected = %d\n", lastId, rowCnt)

		c := pool.Get()
		// 连接完关闭，其实没有关闭，是放回池里，也就是队列里面，等待下一个重用
		defer c.Close()
		redis.Bool(c.Do("PUBLISH", fmt.Sprintf("channel:%s", cname), "hangup"))
	}

	// fmt.Printf("%v", eventMap)
}

func main() {
	db, err = sql.Open("mysql", "root:haosoo8888@tcp(127.0.0.1:3306)/call?charset=utf8")
	if err != nil {
		log.Fatal(err)
	}
	db.SetMaxOpenConns(2000)
	db.SetMaxIdleConns(1000)
	defer db.Close()
	err = db.Ping()
	if err != nil {
		fmt.Println("数据库连接错误!")
	}

	pool = newPool(redisServer)

	// Init a syslog writter for our test
	l, errLog := syslog.New(syslog.LOG_INFO, "TestFSock")
	if errLog != nil {
		l.Crit(fmt.Sprintf("Cannot connect to syslog:", errLog))
		return
	}
	// No filters
	evFilters := map[string]string{}
	// We are interested in heartbeats, define handler for them
	evHandlers := map[string][]func(string){"CHANNEL_CREATE": []func(string){printChannelCreate}, "CHANNEL_ANSWER": []func(string){printChannelAnswer}, "CHANNEL_HANGUP_COMPLETE": []func(string){printChannelHungup}}
	// evHandlers := map[string][]func(string){"CHANNEL_CREATE": []func(string){printChannelCreate}}
	fs, err := fsock.NewFSock("127.0.0.1:8021", "ClueCon", 10, evHandlers, evFilters, l)
	if err != nil {
		l.Crit(fmt.Sprintf("FreeSWITCH error:", err))
		return
	}
	fs.ReadEvents()
}
