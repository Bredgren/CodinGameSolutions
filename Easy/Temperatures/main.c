#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    int n; // the number of temperatures to analyse
    scanf("%d", &n);
    int closest = 0; // Possible improvement: use ?: on n to choose 0 or 5526.
    for (int i = 0; i < n; i++) {
        int t; // a temperature expressed as an integer ranging from -273 to 5526
        scanf("%d", &t);
        if (i == 0 || abs(t) < abs(closest) || (t + closest == 0 && t > closest)) {
            closest = t;
        }
    }

    printf("%d\n", closest);

    return 0;
}
