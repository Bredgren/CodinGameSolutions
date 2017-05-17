import Glibc
import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) { fputs(string, stderr) }
}
public var errStream = StderrOutputStream()

var strengths: [Int] = []

let N = Int(readLine()!)!
if N > 0 {
    for i in 0...(N-1) {
        let pi = Int(readLine()!)!
        strengths.append(pi)
    }
}

strengths.sort()

var min = strengths[1] - strengths[0]
for i in 1...N-2 {
    let d = strengths[i+1] - strengths[i]
    if d < min {
        min = d
    }
}

print(min)

// Write an action using print("message...")
// To debug: print("Debug messages...", to: &errStream)
