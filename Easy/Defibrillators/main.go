package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "strconv"
import "math"

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1000000), 1000000)

	var LON string
	scanner.Scan()
	fmt.Sscan(scanner.Text(), &LON)

	var LAT string
	scanner.Scan()
	fmt.Sscan(scanner.Text(), &LAT)

	var N int
	scanner.Scan()
	fmt.Sscan(scanner.Text(), &N)

	lon, _ := strconv.ParseFloat(strings.Replace(LON, ",", ".", -1), 64)
	lat, _ := strconv.ParseFloat(strings.Replace(LAT, ",", ".", -1), 64)

	closest := ""
	d := -1.0
	for i := 0; i < N; i++ {
		scanner.Scan()
		DEFIB := scanner.Text()
		data := strings.Split(DEFIB, ";")
		name := data[1]
		lonD, _ := strconv.ParseFloat(strings.Replace(data[4], ",", ".", -1), 64)
		latD, _ := strconv.ParseFloat(strings.Replace(data[5], ",", ".", -1), 64)
		distTo := dist(lon, lat, lonD, latD)
		if d == -1 || distTo < d {
			closest = name
			d = distTo
		}
	}

	fmt.Println(closest)

	// fmt.Fprintln(os.Stderr, "Debug messages...")
}

func dist(longA, latA, longB, latB float64) float64 {
	x := (longB - longA) * math.Cos((latA+latB)/2)
	y := latB - latA
	return math.Sqrt(x*x+y*y) * 6371
}
