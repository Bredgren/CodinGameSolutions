#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define MAX_WIDTH 30
#define MAX_HEIGHT 30
#define MAX_TEXT 200
#define NUM_LETTERS 26
#define MAX_ROW (NUM_LETTERS * MAX_WIDTH)

int main() {
    int w;
    scanf("%d", &w);
    int h;
    scanf("%d", &h); fgetc(stdin);
    char text[MAX_TEXT];
    fgets(text, MAX_TEXT, stdin);
    for (int r = 0; r < h; r++) {
        char row[MAX_ROW];
        fgets(row, MAX_ROW, stdin);

        // strlen(text) - 1 to skip newline character
        for (int c = 0; c < strlen(text) - 1; c++) {
            int offset = isalpha(text[c]) ? toupper(text[c]) - 'A' : NUM_LETTERS;
            int start = w * offset;
            for (int i = 0; i < w; i++) {
                printf("%c", row[start + i]);
            }
        }
        printf("\n");
    }

    return 0;

    // To debug: fprintf(stderr, "Debug messages...\n");
}

/* User: Alain-Delpuch
// Notes:
//   - More compact scanf
//   - Iterate over char*

#include <stdio.h>
#include <ctype.h>

main() {
    int L,H;
    scanf("%d%d ", &L, &H);

    char ROW[28][L];

    char T[257];
    gets(T);

    while (H--) {
        gets(ROW);
        for (char *p=T;*p;p++) { // for all letters to display
            unsigned int c = toupper(*p) - 'A';
            if ( c > 26 ) c = 26;
            printf("%.*s", L, ROW+c);
        }
        printf("\n"); ;
    }
}
*/
