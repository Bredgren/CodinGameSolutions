input = new Scanner(System.in);

N = input.nextInt()
strengths = []
for (i = 0; i < N; ++i) {
    strengths << input.nextInt()
}
strengths.sort()
strengths = [strengths.tail(), strengths].transpose()
min = strengths.inject(Integer.MAX_VALUE) { res, i -> i[0] - i[1] < res ? i[0] - i[1] : res }

println "${min}"

// Write an answer using println
// To debug: System.err << "Debug messages...\n"
