package main

import "fmt"
import "os"
import "bufio"
import "math"
import "unicode"

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1000000), 1000000)

	var L int
	scanner.Scan()
	fmt.Sscan(scanner.Text(), &L)

	var H int
	scanner.Scan()
	fmt.Sscan(scanner.Text(), &H)

	letters := []rune{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
		'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '?'}
	rowLetter := []map[rune]string{}
	scanner.Scan()
	T := scanner.Text()
	for i := 0; i < H; i++ {
		scanner.Scan()
		row := scanner.Text()
		// fmt.Println(len(row), row)
		rowLetter = append(rowLetter, make(map[rune]string))
		for c := 0; c < len(letters); c++ {
			// fmt.Print(c, L, c*L, c*L+L)
			// fmt.Printf(" '%s'\n", row[c*L:int(math.Min(float64(c*L+L), float64(len(row))))])
			l := row[c*L : int(math.Min(float64(c*L+L), float64(len(row))))]
			rowLetter[i][letters[c]] = l
		}
	}
	// fmt.Fprintln(os.Stderr, "Debug messages...")

	for r := 0; r < H; r++ {
		for _, c := range T {
			l, ok := rowLetter[r][unicode.ToUpper(c)]
			if !ok {
				l = rowLetter[r]['?']
			}
			fmt.Print(l)
		}
		fmt.Println()
	}
}
