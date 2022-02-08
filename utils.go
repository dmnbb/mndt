package mndt

import "time"

func CurMs() int64 {
	return time.Now().UnixNano() / 1e6
}
