import 'dart:io';
import 'dart:math';

double distance(lonA, latA, lonB, latB) {
    double x = (lonB - lonA) * cos((latA + latB) / 2);
    double y = latB - latA;
    return sqrt(x*x + y*y) * 6371;
}

void main() {
    convertNum(s) => double.parse(s.replaceAll(",", ".")) / 180 * PI;

    double lon = convertNum(stdin.readLineSync());
    double lat = convertNum(stdin.readLineSync());

    double minDist;
    String answer = "";

    int n = int.parse(stdin.readLineSync());
    for (int i = 0; i < n; i++) {
        String defib = stdin.readLineSync();
        List<String> tokens = defib.split(";");
        double lonB = convertNum(tokens[4]);
        double latB = convertNum(tokens[5]);

        double dist = distance(lon, lat, lonB, latB);
        if (answer.isEmpty || dist < minDist) {
            minDist = dist;
            answer = tokens[1];
        }
    }


    print(answer);

    // To debug: stderr.writeln('Debug messages...');
}
