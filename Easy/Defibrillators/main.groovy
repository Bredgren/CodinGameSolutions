input = new Scanner(System.in);

def convertNum(s) {
    Math.toRadians(s.replaceAll(",", ".").toFloat())
}

def distance(lonA, latA, lonB, latB) {
    x = (lonB - lonA) * Math.cos((latA + latB) / 2)
    y = latB - latA
    Math.sqrt(x*x + y*y) * 6371
}

lon = convertNum(input.next())
lat = convertNum(input.next())
n = input.nextInt()
input.nextLine()
minDist = 0;
answer = "";
for (i = 0; i < n; ++i) {
    tokens = input.nextLine().tokenize(';');
    lonB = convertNum(tokens[-2])
    latB = convertNum(tokens[-1])
    dist = distance(lon, lat, lonB, latB)
    if (!answer || dist < minDist) {
        minDist = dist
        answer = tokens[1]
    }
}

println answer

// To debug: System.err << "Debug messages...\n"
