package main

import "fmt"
import "os"
import "bufio"
import "strings"

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1000000), 1000000)

	scanner.Scan()
	message := scanner.Text()
	out := []string{}
	on := -1
	for _, c := range message {
		for i := 6; i >= 0; i-- {
			if int(c)&(1<<uint(i)) > 0 {
				if on != 1 {
					out = append(out, "0", "")
					on = 1
				}
			} else {
				if on != 0 {
					out = append(out, "00", "")
					on = 0
				}
			}
			out[len(out)-1] += "0"
		}
	}
	fmt.Println(strings.Join(out, " "))

	// fmt.Fprintln(os.Stderr, "Debug messages...")
}

/* Cool solution by someone else
package main

import ("fmt"; "os"; "bufio"; "strings"; "regexp")

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Scan()
    m := scanner.Text()
    result := ""
    for _,c := range m { result += fmt.Sprintf("%07b", int(c)) }
    result = regexp.MustCompile("(0+)").ReplaceAllStringFunc(result,
        func(s string) string { return " 00 " + s })
    result = regexp.MustCompile("(1+)").ReplaceAllStringFunc(result,
        func(s string) string { return " 0 " + strings.Repeat("0", len(s)) })
    fmt.Println(strings.Trim(result, " "))
}
*/
