var N = parseInt(readline());
var strengths = [];
for (var i = 0; i < N; i++) {
    var pi = parseInt(readline());
    strengths[i] = pi;
}

strengths.sort((a, b) => a - b);

var min = strengths[1] - strengths[0];
for (var i = 0; i < strengths.length - 1; i++) {
    var d = strengths[i + 1] - strengths[i];
    if (d < min) {
        min = d;
    }
}

print(min);
