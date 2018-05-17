#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    int surfaceN; // the number of points used to draw the surface of Mars.
    scanf("%d", &surfaceN);
    int targetY = 0;
    int prev = -1;
    for (int i = 0; i < surfaceN; i++) {
        int landX; // X coordinate of a surface point. (0 to 6999)
        int landY; // Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
        scanf("%d%d", &landX, &landY);
        if (landY == prev) {
            targetY = landY;
        }
        prev = landY;
    }

    const float maxSpeed = 40 - 4; // Max landing speed - max thrust
    const float gravity = -3.711;

    // game loop
    while (1) {
        int X;
        int Y;
        int hSpeed; // the horizontal speed (in m/s), can be negative.
        int vSpeed; // the vertical speed (in m/s), can be negative.
        int fuel; // the quantity of remaining fuel in liters.
        int rotate; // the rotation angle in degrees (-90 to 90).
        int power; // the thrust power (0 to 4).
        scanf("%d%d%d%d%d%d%d", &X, &Y, &hSpeed, &vSpeed, &fuel, &rotate, &power);

        float dist = (float) (Y - targetY);
        float speed2 = (float) (vSpeed * vSpeed) - (maxSpeed * maxSpeed);
        // This calculates the rough point where max thrust is required to land at just under a speed of 40.
        int thrust = speed2 >= dist * (4 + gravity) ? 4 : 0;

        // 2 integers: rotate power. rotate is the desired rotation angle (should be 0 for level 1), power is the desired thrust power (0 to 4).
        printf("0 %d\n", thrust);
    }

    return 0;
}
