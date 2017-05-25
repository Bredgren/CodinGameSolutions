import java.util.*;
import java.io.*;
import java.math.*;

class Solution {
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        double lon = convertNum(in.next());
        double lat = convertNum(in.next());
        int n = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        double minDist = 0;
        String answer = "";
        for (int i = 0; i < n; i++) {
            String defib = in.nextLine();
            String[] tokens = defib.split(";");
            double dist = distance(lon, lat, convertNum(tokens[4]), convertNum(tokens[5]));
            if (answer == "" || dist < minDist) {
                minDist = dist;
                answer = tokens[1];
            }
        }

        System.out.println(answer);
        // To debug: System.err.println("Debug messages...");
    }

    static double convertNum(String s) {
        return Math.toRadians(Double.parseDouble(s.replace(',', '.')));
    }

    static double distance(double lonA, double latA, double lonB, double latB) {
        double x = (lonB - lonA) * Math.cos((latA + latB) / 2);
        double y = latB - latA;
        return Math.sqrt(x*x + y*y) * 6371;
    }
}
