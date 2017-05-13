#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int cmp(const void *a, const void *b) {
    return *(int*)a - *(int*)b;
}

int main() {
    int N;
    scanf("%d", &N);
    int strengths[N];
    for (int i = 0; i < N; i++) {
        int Pi;
        scanf("%d", &Pi);
        strengths[i] = Pi;
    }

    qsort(strengths, N, sizeof(int), cmp);

    int min = strengths[1] - strengths[0];
    for (int i = 1; i < N - 1; i++) {
        int d = strengths[i + 1] - strengths[i];
        if (d < min) {
            min = d;
        }
    }

    printf("%d\n", min);

    return 0;
}
