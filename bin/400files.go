package main

import (
	"bufio"
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
)

func main() {
	//打开文件，并进行相关处理
	f, err := os.Open("400nums.txt")
	if err != nil {
		panic(err)
	}
	defer f.Close()

	rd := bufio.NewReader(f)
	for {
		line, err := rd.ReadBytes('\n') //以'\n'为结束符读入一行
		line = bytes.TrimRight(line, "\r\n")

		if err != nil || io.EOF == err {
			break
		} else {
			// fmt.Printf("%s", line)
			// fmt.Println(fmt.Sprintf("/%s/d", line))
			cmd, err := exec.Command("sed", "-i", fmt.Sprintf("/%s/d", line), "tt.z0202").Output()
			if err != nil {
				fmt.Println(err)
			}
			fmt.Println(cmd)
		}

	}

	//将文件作为一个io.Reader对象进行buffered I/O操作
	// br := bufio.NewReader(f)
	// for {
	//	//每次读取一行
	//	line, err := br.ReadString('\n')
	//	if err == io.EOF {
	//		break
	//	} else {
	//		fmt.Printf("%v", line)
	//	}
	// }
}
