package main

import "fmt"

func main() {
	// lightX: the X position of the light of power
	// lightY: the Y position of the light of power
	// initialTX: Thor's starting X position
	// initialTY: Thor's starting Y position
	var lightX, lightY, initialTX, initialTY int
	fmt.Scan(&lightX, &lightY, &initialTX, &initialTY)

	x, y := initialTX, initialTY

	for {
		// remainingTurns: The remaining amount of turns Thor can move. Do not remove this line.
		var remainingTurns int
		fmt.Scan(&remainingTurns)

		// A single line providing the move to be made: N NE E SE S SW W or NW
		dx, dy := lightX-x, lightY-y
		//fmt.Fprintln(os.Stderr, dx, dy)
		dir := ""
		if dy > 0 {
			dir += "S"
			y++
		} else if dy < 0 {
			dir += "N"
			y--
		}
		if dx > 0 {
			dir += "E"
			x++
		} else if dx < 0 {
			dir += "W"
			x--
		}
		fmt.Println(dir)
	}
}
