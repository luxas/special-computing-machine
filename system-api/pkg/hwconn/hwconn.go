package hwconn

const DefaultPacketSize int = 255

type HwConn interface {
	// Default packet size is 255 bytes
	SetPacketSize(int)
	// Tx writes writebuf to the channel, and reads a packet of the specified size
	// Tx returns available (read) bytes
	Tx(writebuf []byte) (readbuf []byte, n int, err error)

	// Close closes and cleans up the connection
	Close() error
}
