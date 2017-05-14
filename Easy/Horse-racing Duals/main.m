#include <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int N;
    scanf("%d", &N);
    NSMutableArray *strengths = [NSMutableArray arrayWithCapacity:N];
    for (int i = 0; i < N; i++) {
        int Pi;
        scanf("%d", &Pi);
        [strengths addObject:[NSNumber numberWithInt:Pi]];
    }

    [strengths sortUsingSelector:@selector(compare:)];

    int min = [[strengths objectAtIndex:1] intValue] - [[strengths objectAtIndex:0] intValue];
    for (int i = 1; i < N - 1; i++) {
        int d = [[strengths objectAtIndex:i+1] intValue] - [[strengths objectAtIndex:i] intValue];
        if (d < min) {
            min = d;
        }
    }

    printf("%d\n", min);

    // Write an action using printf(). DON'T FORGET THE TRAILING NEWLINE \n
    // To debug: fprintf(stderr, [@"Debug messages\n" UTF8String]);
}

// For future reference it seems I can just use the same/similar solution as C.
