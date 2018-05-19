package main

import "fmt"

func main() {
	for {
		m := -1
		h := -1
		for i := 0; i < 8; i++ {
			// mountainH: represents the height of one mountain.
			var mountainH int
			fmt.Scan(&mountainH)
			if mountainH > h {
				h = mountainH
				m = i
			}
		}

		fmt.Printf("%d\n", m) // The index of the mountain to fire on.
	}
}
