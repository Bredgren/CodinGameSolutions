#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct entry {
    char ext[101], mime[501];
} Entry;

const char *lookup(const Entry map[], const int len, const char *ext) {
    for (int i = 0; i < len; i++) {
        if (strcmp(map[i].ext, ext) == 0) {
            return map[i].mime;
        }
    }
    return NULL;
}

const char *getExt(const char *fname) {
    const char *dot = strrchr(fname, '.');
    if (!dot) {
        return "";
    }
    return dot + 1;
}

void strip(char *str) {
    *strchr(str, '\n') = '\0';
}

void lower(char *str) {
    for(int i = 0; str[i]; i++){
        str[i] = tolower(str[i]);
    }
}

int main() {
    int n; // Number of elements which make up the association table.
    scanf("%d", &n);
    int q; // Number q of file names to be analyzed.
    scanf("%d", &q);

    Entry map[n];

    for (int i = 0; i < n; i++) {
        char ext[101]; // file extension
        char mt[501]; // MIME type.
        scanf("%s%s", ext, mt); fgetc(stdin);
        lower(ext);
        strcpy(map[i].ext, ext);
        strcpy(map[i].mime, mt);
    }

    for (int i = 0; i < q; i++) {
        char fname[501]; // One file name per line.
        fgets(fname, 501, stdin); // One file name per line.
        strip(fname);
        const char *ext = getExt(fname);
        lower(ext);
        char *mime = lookup(map, n, ext);
        if (!mime) {
            printf("UNKNOWN\n");
        } else {
            printf("%s\n", mime);
        }
    }

    // To debug: fprintf(stderr, "Debug messages...\n");

    return 0;
}

/* Cool solution by someone else
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
struct mt {
    char *ext;
    char *mt;
};
int cmp(struct mt *a, struct mt *b)
{
    return strcmp(a->ext, b->ext);
}
int main()
{
    int N, Q;
    scanf("%d%d", &N, &Q);
    struct mt a[N];
    for (int i = 0; i < N; i++) {
        char EXT[100]; // file extension
        char MT[500];  // MIME type.
        scanf("%s%s\n", EXT, MT);
        for (char *c = EXT; *c; c++) *c = tolower(*c);
        a[i].ext = malloc(strlen(EXT)+1);
        strcpy(a[i].ext, EXT);
        a[i].mt = malloc(strlen(MT)+1);
        strcpy(a[i].mt, MT);
    }
    qsort(a, N, sizeof(struct mt), cmp);
    for (int i = 0; i < Q; i++) {
        char FNAME[500];
        fgets(FNAME,500,stdin);
        char *p = strrchr(FNAME, '.'), *q;
        if (!p) { puts("UNKNOWN"); continue; }
        for (q = p+1; *q != '\n'; q++) *q = tolower(*q);
        *q = '\0';
        struct mt k, *e;
        k.ext = p+1;
        e = bsearch(&k, a, N, sizeof (struct mt), cmp);
        if (e) puts(e->mt);
        else puts("UNKNOWN");
    }
    return 0;
}
*/
