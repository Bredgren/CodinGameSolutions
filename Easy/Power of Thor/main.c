#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    int lightX; // the X position of the light of power
    int lightY; // the Y position of the light of power
    int x; // Thor's starting X position
    int y; // Thor's starting Y position
    scanf("%d%d%d%d", &lightX, &lightY, &x, &y);

    // game loop
    while (1) {
        int remainingTurns; // The remaining amount of turns Thor can move. Do not remove this line.
        scanf("%d", &remainingTurns);

        char dir[3] = {'\0', '\0', '\0'};

        int i = 0;
        if (y < lightY) {
            dir[i] = 'S';
            i++;
            y++;
        } else if (y > lightY) {
            dir[i] = 'N';
            i++;
            y--;
        }

        if (x < lightX) {
            dir[i] = 'E';
            i++;
            x++;
        } else if (x > lightX) {
            dir[i] = 'W';
            i++;
            x--;
        }

        // A single line providing the move to be made: N NE E SE S SW W or NW
        printf("%s\n", dir);
    }

    return 0;
}

/* player_one
int main()
{
    int lightX; // the X position of the light of power
    int lightY; // the Y position of the light of power
    int initialTX; // Thor's starting X position
    int initialTY; // Thor's starting Y position
    scanf("%d%d%d%d", &lightX, &lightY, &initialTX, &initialTY);
    int xNeeded = lightX - initialTX;
    int yNeeded = lightY - initialTY;

    char *moveMap[3][3] = {
        { "NW", "W", "SW" },
        { "N", "XX", "S" },
        { "NE", "E", "SE" }
    };

    // game loop
    while (1) {
        int remainingTurns; // The remaining amount of turns Thor can move. Do not remove this line.
        scanf("%d", &remainingTurns);

        int xVect = xNeeded != 0 ? xNeeded / abs(xNeeded) : 0;
        int yVect = yNeeded != 0 ? yNeeded / abs(yNeeded) : 0;
        xNeeded -= xVect;
        yNeeded -= yVect;

        printf("%s\n", moveMap[xVect+1][yVect+1]); // A single line providing the move to be made: N NE E SE S SW W or NW
    }

    return 0;
}
*/
/* Alain-Delpuch
main() {
    int X; // the X position of the light of power
    int Y; // the Y position of the light of power
    int TX; // Thor's starting X position
    int TY; // Thor's starting Y position
    scanf("%d%d%d%d", &X, &Y, &TX, &TY);
    while (1) {
        if (TY < Y) TY++ , printf("S");
        if (TY > Y) TY-- , printf("N");
        if (TX < X) TX++ , printf("E");
        if (TX > X) TX-- , printf("W");
        printf("\n");
    }
}
*/
