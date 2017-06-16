#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void strip(char *str) {
    *strchr(str, '\n') = '\0';
}

void printBlock(int digit, int count) {
    printf("%s ", digit ? "0" : "00");
    for (;count > 0; count--) {
        printf("0");
    }
}

int main() {
    char message[101];
    fgets(message, 101, stdin);
    strip(message);

    int currentDigit = 0;
    int count = 0;
    for (int i = 0; i < strlen(message); i++) {
        char c = message[i];
        for (int j = 6; j >= 0; j--) {
            int digit = (c & (1 << j)) > 0;
            if (currentDigit != digit) {
                if (count) {
                    printBlock(currentDigit, count);
                    printf(" ");
                }
                currentDigit = digit;
                count = 1;
            } else {
                count++;
            }
        }
    }
    printBlock(currentDigit, count);

    return 0;

    // To debug: fprintf(stderr, "Debug messages...\n");
}
