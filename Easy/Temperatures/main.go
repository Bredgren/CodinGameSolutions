package main

import "fmt"
import "os"
import "bufio"
import "math"
import "strings"
import "strconv"

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1000000), 1000000)

	// n: the number of temperatures to analyse
	var n int
	scanner.Scan()
	fmt.Sscan(scanner.Text(), &n)

	scanner.Scan()
	tempStr := scanner.Text() // the n temperatures expressed as integers ranging from -273 to 5526
	temps := strings.Split(tempStr, " ")
	closest := 0
	for i, ts := range temps {
		t, _ := strconv.ParseInt(ts, 10, 64)
		absT := int(math.Abs(float64(t)))
		absC := int(math.Abs(float64(closest)))
		if i == 0 || absT < absC || (absT == absC && t > 0) {
			closest = int(t)
		}
	}

	// fmt.Fprintln(os.Stderr, "Debug messages...")
	fmt.Printf("%d\n", closest) // Write answer to stdout
}
