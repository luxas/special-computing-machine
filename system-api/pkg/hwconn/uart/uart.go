package uart

import (
	"bytes"
	"encoding/hex"
	"errors"
	"io"

	"github.com/albenik/go-serial"
	"github.com/luxas/special-computing-machine/system-api/pkg/hwconn"
)

var (
	endChar = byte('\n')

	writeTooLarge = errors.New("underlying write buffer larger than given write buffer")
)

func NewHwConn(devpath string, baud int) (hwconn.HwConn, error) {
	mode := &serial.Mode{
		BaudRate: baud,
		Parity:   serial.NoParity,
		DataBits: 8,
		StopBits: serial.OneStopBit,
	}
	port, err := serial.Open(devpath, mode)
	if err != nil {
		return nil, err
	}

	port.SetReadTimeout(0)

	portRW := newSerialReadWriter(port)
	paddingRW := newPaddingReadWriter(portRW, endChar)
	hexRW := newHexReadWriter(paddingRW)

	return &hwConn{port, hexRW, hwconn.DefaultPacketSize}, nil
}

type hwConn struct {
	port    serial.Port
	hexRW   io.ReadWriter
	bufSize int
}

func (c *hwConn) SetPacketSize(size int) {
	c.bufSize = size
}

func (c *hwConn) Tx(writebuf []byte) (readbuf []byte, n int, err error) {
	if writebuf != nil && len(writebuf) != 0 {
		if len(writebuf) > c.bufSize {
			err = writeTooLarge
			return
		}

		n, err = c.hexRW.Write(writebuf)
		if err != nil {
			return
		}
	}

	readbuf = make([]byte, c.bufSize)
	var n2 int
	n2, err = c.hexRW.Read(readbuf)
	n += n2
	if err == io.EOF {
		err = nil
	}
	return
}

func (c *hwConn) Close() error {
	return c.port.Close()
}

func newHexReadWriter(rw io.ReadWriter) io.ReadWriter {
	return &hexReadWriter{hex.NewEncoder(rw), hex.NewDecoder(rw)}
}

type hexReadWriter struct {
	io.Writer
	io.Reader
}

func newPaddingReadWriter(rw io.ReadWriter, padding byte) io.ReadWriter {
	return &paddingReadWriter{rw, new(bytes.Buffer), padding}
}

type paddingReadWriter struct {
	rw      io.ReadWriter
	buf     *bytes.Buffer
	padding byte
}

func (rw *paddingReadWriter) Write(p []byte) (n int, err error) {
	n, err = rw.rw.Write(p)
	if err != nil {
		return
	}
	_, err = rw.rw.Write([]byte{rw.padding})
	return
}

func (rw *paddingReadWriter) Read(p []byte) (n int, err error) {
	//buf := make([]byte, len(p)+len(rw.padding))
	if rw.buf.Len() == 0 {
		// read from the underlying reader to the buffer
		_, err = io.Copy(rw.buf, rw.rw)
		if err != nil {
			return
		}
	}

	// Read one "line" from the buffer
	b, err := rw.buf.ReadBytes(rw.padding)
	if err != nil {
		return
	}

	// Verify we have room in p to write to
	if len(b) > len(p) {
		err = writeTooLarge
		return
	}

	// Copy over the data from b to p
	for i := 0; i < len(b)-1; i++ {
		p[i] = b[i]
		n++
	}
	return
}

func newSerialReadWriter(port serial.Port) io.ReadWriter {
	return &serialReadWriter{port}
}

type serialReadWriter struct {
	port serial.Port
}

func (rw *serialReadWriter) Write(p []byte) (n int, err error) {
	n, err = rw.port.Write(p)
	return
}

func (rw *serialReadWriter) Read(p []byte) (n int, err error) {
	var availbytes uint32
	availbytes, err = rw.port.ReadyToRead()
	if err != nil {
		return
	}
	if availbytes > 0 {
		// Read from the underlying connection, and set the error to EOF if we've read everything we can
		n, err = rw.port.Read(p)
		if n == int(availbytes) {
			err = io.EOF
			return
		}
	}
	return
}
