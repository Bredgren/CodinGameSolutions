package main

import "fmt"
import "sort"

func main() {
	var N int
	fmt.Scan(&N)

	strengths := make([]int, N)
	for i := 0; i < N; i++ {
		var Pi int
		fmt.Scan(&Pi)
		strengths[i] = Pi
	}

	sort.Ints(strengths)

	min := -1
	for i, s := range strengths[:N-1] {
		d := strengths[i+1] - s
		if min == -1 || d < min {
			min = d
		}
	}

	fmt.Println(min)
}
