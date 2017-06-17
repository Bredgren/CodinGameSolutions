using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;

class Solution {
    static void Main(string[] args) {
        string message = Console.ReadLine();

        int currentDigit = 0;
        int count = 0;
        foreach (char c in message.ToCharArray()) {
            for (int i = 6; i >= 0; i--) {
                int digit = ((c & (1 << i)) >> i) & 1;
                if (currentDigit != digit) {
                    if (count > 0) {
                        printBlock(currentDigit, count);
                        Console.Write(" ");
                    }
                    currentDigit = digit;
                    count = 1;
                } else {
                    count++;
                }
            }
        }
        printBlock(currentDigit, count);

        // To debug: Console.Error.WriteLine("Debug messages...");
    }

    static void printBlock(int digit, int count) {
        Console.Write(digit > 0 ? "0 " : "00 ");
        for (; count > 0; count--) {
            Console.Write("0");
        }
    }
}

/* Cool solution by others
using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;

class Solution
{
    static void Main(string[] args)
    {
        string MESSAGE = Console.ReadLine();

        string encode = MESSAGE.Select(x => (int)x)
            .Select(x => Convert.ToString(x, 2).PadLeft(7, '0'))
            .Aggregate((x,y) => x + y);

        encode = Regex.Replace(encode, @"(0+)", "00 $1 ");
        encode = Regex.Replace(encode, @"(1+)", "0 $1 ")
                    .Replace("1","0");

        Console.WriteLine(encode.TrimEnd());
    }
}
*//*
using System;
using System.Linq;
using System.IO;

class Solution
{
    static void Main(string[] args)
    {
        var line    = Console.ReadLine();
        var bits    = string.Join(string.Empty, line.Select(c =>  Convert.ToString((byte)c, 2).PadLeft(7,'0')));
        var bitSeq  = bits.Replace("10", "1 0").Replace("01", "0 1").Split(' ');
        var unaries = bitSeq.Select(s => s.StartsWith("0") ? "00 " + s : "0 " + s.Replace("1", "0"));
        var result  = string.Join(" ", unaries);

        Console.WriteLine(result);
    }
}
*/
