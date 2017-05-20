using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;

class Solution {
    static double convertNum(string str) {
        return Double.Parse(str.Replace(",", ".")) / 180 * Math.PI;
    }

    static double distance(double lonA, double latA, double lonB, double latB) {
        double x = (lonB - lonA) * Math.Cos((latA + latB) / 2);
        double y = latB - latA;
        return Math.Sqrt(x*x + y*y) * 6371;
    }

    static void Main(string[] args) {
        double lon = convertNum(Console.ReadLine());
        double lat = convertNum(Console.ReadLine());

        string answer = "";
        double minDist = 0;

        int n = int.Parse(Console.ReadLine());
        for (int i = 0; i < n; i++) {
            string defib = Console.ReadLine();
            string[] tokens = defib.Split(';');
            double lonB = convertNum(tokens[4]);
            double latB = convertNum(tokens[5]);
            double dist = distance(lon, lat, lonB, latB);
            if (answer == "" || dist < minDist) {
                answer = tokens[1];
                minDist = dist;
            }
        }

        Console.WriteLine(answer);

        // To debug: Console.Error.WriteLine("Debug messages...");
    }
}
