package main

import (
	"encoding/binary"
	"flag"
	"fmt"
	"log"
	"math/rand"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/luxas/special-computing-machine/system-api/pkg/hwconn/uart"
)

var (
	device = flag.String("device", "", "What UART device to use")
	name   = flag.String("name", "", "What's your name?")
)

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}

// Open PTYs with "socat -dd pty,raw,echo=0 pty,raw,echo=0" or "sudo socat PTY,link=/dev/ttyS10 PTY,link=/dev/ttyS11"

func run() error {
	flag.Parse()
	if len(*device) == 0 {
		return fmt.Errorf("device is required")
	}
	conn, err := uart.NewHwConn(*device, 115200)
	if err != nil {
		return err
	}

	c := make(chan os.Signal)
	signal.Notify(c, os.Interrupt, syscall.SIGTERM)
	go func() {
		<-c
		log.Printf("Caught exit signal, stopping...")
		if err := conn.Close(); err != nil {
			log.Fatal(err)
		}
		os.Exit(1)
	}()

	writebuf := make([]byte, 5)
	writebuf = append(writebuf, []byte(*name)...)
	rand.Seed(time.Now().UnixNano())
	for {
		time.Sleep(1 * time.Second)

		binary.BigEndian.PutUint32(writebuf[0:4], rand.Uint32())
		writebuf[4] = byte('\n')
		log.Printf("writebuf is: % x", writebuf)
		resp, n, err := conn.Tx(writebuf)
		if err != nil {
			log.Printf("error: %v, n: %d, resp: % x", err, n, resp)
			continue
		}
		log.Printf("n: %d", n)
		if resp != nil {
			log.Printf("response: % x", resp[:10])
		}
	}
	return nil
}
