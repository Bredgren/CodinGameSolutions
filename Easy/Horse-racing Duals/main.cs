using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;


class Solution {
    static void Main(string[] args) {
        int N = int.Parse(Console.ReadLine());

        var strengths = new List<int>();
        for (int i = 0; i < N; i++) {
            int pi = int.Parse(Console.ReadLine());
            strengths.Add(pi);
        }

        strengths.Sort();
        int min = -1;
        for (int i = 0; i < strengths.Count - 1; i++) {
            int d = strengths[i + 1] - strengths[i];
            if (min == -1 || d < min) {
                min = d;
            }
        }

        Console.WriteLine(min);
    }
}
