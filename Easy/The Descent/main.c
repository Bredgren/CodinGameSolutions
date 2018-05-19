#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    while (1) {
        int m = 0;
        int max = 0;
        for (int i = 0; i < 8; i++) {
            int height;
            scanf("%d", &height);
            if (height > max) {
                max = height;
                m = i;
            }
        }
        printf("%d\n", m);
    }

    return 0;
}
