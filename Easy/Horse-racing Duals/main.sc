import math._
import scala.util._

object Solution extends App {
    val strengths = (1 to readInt).map((_) => readInt).sorted
    println(strengths.zip(strengths.tail).map((s) => s._2 - s._1).min)

    // Write an action using println
    // To debug: Console.err.println("Debug messages...")
}
