import 'dart:io';
import 'dart:math';

void main() {
    int N = int.parse(stdin.readLineSync());
    var strengths = new List(N);
    for (int i = 0; i < N; i++) {
        int Pi = int.parse(stdin.readLineSync());
        strengths[i] = Pi;
    }

    strengths.sort();

    int min = strengths[1] - strengths[0];
    for (int i = 0; i < N - 1; i++) {
        int d = strengths[i + 1] - strengths[i];
        if (d < min) {
            min = d;
        }
    }

    print(min);

    // stderr.writeln('Debug messages...');
}
