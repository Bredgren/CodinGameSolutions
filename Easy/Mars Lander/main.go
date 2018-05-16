package main

import "fmt"

func main() {
	// surfaceN: the number of points used to draw the surface of Mars.
	var surfaceN int
	fmt.Scan(&surfaceN)

	for i := 0; i < surfaceN; i++ {
		// landX: X coordinate of a surface point. (0 to 6999)
		// landY: Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
		var landX, landY int
		fmt.Scan(&landX, &landY)
	}
	for {
		// hSpeed: the horizontal speed (in m/s), can be negative.
		// vSpeed: the vertical speed (in m/s), can be negative.
		// fuel: the quantity of remaining fuel in liters.
		// rotate: the rotation angle in degrees (-90 to 90).
		// power: the thrust power (0 to 4).
		var X, Y, hSpeed, vSpeed, fuel, rotate, power int
		fmt.Scan(&X, &Y, &hSpeed, &vSpeed, &fuel, &rotate, &power)

		// fmt.Fprintln(os.Stderr, "Debug messages...")

		switch {
		case vSpeed > -10:
			fmt.Println("0 0")
		case vSpeed < -40:
			fmt.Println("0 4")
		case vSpeed > -20:
			fmt.Println("0 1")
		case vSpeed > -30:
			fmt.Println("0 2")
		default:
			fmt.Println("0 0")
		}
		// 2 integers: rotate power. rotate is the desired rotation angle (should be 0 for level 1), power is the desired thrust power (0 to 4).
		// fmt.Println("0 3")
	}
}
