import math._
import scala.util._

object Solution extends App {
    def convertNum(s: String): Double = {
        math.toRadians(s.replace(',', '.').toDouble)
    }

    val lonA = convertNum(readLine)
    val latA = convertNum(readLine)
    val n = readInt

    var minDist = 0.0
    var answer = ""

    for(i <- 0 until n) {
        val defib = readLine.split(";")
        val lonB = convertNum(defib(4))
        val latB = convertNum(defib(5))
        val x = (lonB - lonA) * math.cos((latA + latB) / 2)
        val y = latB - latA
        val dist = math.hypot(x, y) * 6371
        if (answer == "" || dist < minDist) {
            minDist = dist
            answer = defib(1)
        }
    }

    println(answer)

    // To debug: Console.err.println("Debug messages...")
}


/* Cool solution by someone else
import math._
import scala.util._

object Solution extends App {

    def dist(longA:Float, latA:Float, longB:Float, latB:Float) = {
        val x = (longB - longA) * cos((latA + latB)/2)
        val y = (latB - latA)
        sqrt(pow(x,2) + pow(y,2)) * 6371
        }

    val long = readLine.replace(',' , '.').toFloat
    val lat = readLine.replace(',' , '.').toFloat

    val r = 0.until(readInt)
        .map(_ => readLine)
        .map(_ split ";")
        .minBy( x => dist(long, lat, x(4).replace(',' , '.').toFloat, x(5).replace(',' , '.').toFloat))

    println(r(1))
}
*/
