package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "path/filepath"

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1000000), 1000000)

	var n int
	scanner.Scan()
	fmt.Sscan(scanner.Text(), &n)

	var numFiles int
	scanner.Scan()
	fmt.Sscan(scanner.Text(), &numFiles)

	mime := map[string]string{}
	for i := 0; i < n; i++ {
		var extension, mimeType string
		scanner.Scan()
		fmt.Sscan(scanner.Text(), &extension, &mimeType)
		mime[strings.ToLower(extension)] = mimeType
	}

	for i := 0; i < numFiles; i++ {
		scanner.Scan()
		fileName := scanner.Text()
		ext := strings.TrimLeft(filepath.Ext(fileName), ".")
		if m, ok := mime[strings.ToLower(ext)]; ok {
			fmt.Println(m)
		} else {
			fmt.Println("UNKNOWN")
		}
	}

	// fmt.Fprintln(os.Stderr, "Debug messages...")
}
