input = new Scanner(System.in);

message = input.nextLine()

bits = message.getBytes("US-ASCII").collect {
    Integer.toBinaryString(it).padLeft(7, "0")
}.join()

answer = bits.replaceAll(/0+|1+/) {
    (it.startsWith("1") ? "0 " : "00 ") + it + " "
}

println answer.replaceAll("1", "0").trim()

// To debug: System.err << "Debug messages...\n"

// Cool solutions bo others
//
// input = new Scanner(System.in);
//
// MESSAGE = input.nextLine()
// println MESSAGE.getBytes()
//     .collect { Integer.toBinaryString(it).padLeft(7, '0') }
//     .join('').replaceAll(/(0+)/, ' 00 $1 ').replaceAll(/(1+)/, ' 0 $1 ')
//     .replaceAll('1', '0').replaceAll(/\s+/, ' ').trim()
////
// println MESSAGE
//     .chars
//     .collect { String.format("%7s", Integer.toBinaryString( (int) it) ).replace(' ', '0') }
//     .join()
//     .split(/(?<=0)(?=1)|(?<=1)(?=0)/)
//     .collect {
//         start = ( it.startsWith('1') ? '0' : '00' )
//         length = "0" * it.size()
//         "$start $length"
//     }
//     .join(" ")
