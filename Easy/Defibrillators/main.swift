import Glibc
import Foundation

// public struct StderrOutputStream: TextOutputStream {
//     public mutating func write(_ string: String) { fputs(string, stderr) }
// }
// public var errStream = StderrOutputStream()
// To debug: print("Debug messages...", to: &errStream)

func convertNum(str: String) -> Double{
    return Double(str.replacingOccurrences(of: ",", with: "."))! / 180 * M_PI
}

let lonA = convertNum(str: readLine()!)
let latA = convertNum(str: readLine()!)
let n = Int(readLine()!)!

var minDist = 0.0
var answer = ""

for i in 0..<n {
    let defib = readLine()!.components(separatedBy: ";")
    let lonB = convertNum(str: defib[4])
    let latB = convertNum(str: defib[5])
    let x = (lonB - lonA) * cos((latA + latB) / 2)
    let y = latB - latA
    let dist = hypot(x, y) * 6371
    if answer == "" || dist < minDist {
        minDist = dist
        answer = defib[1]
    }
}

print(answer)
