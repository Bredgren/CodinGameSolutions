using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;

class Solution {
    static void Main(string[] args) {
        int numElems = int.Parse(Console.ReadLine());
        int numFiles = int.Parse(Console.ReadLine());

        Dictionary<string, string> map = new Dictionary<string, string>();

        for (int i = 0; i < numElems; i++) {
            string[] inputs = Console.ReadLine().Split(' ');
            string ext = inputs[0];
            string mt = inputs[1];
            map.Add(ext.ToLower(), mt);
        }

        for (int i = 0; i < numFiles; i++) {
            string fname = Console.ReadLine();
            string ext = Path.GetExtension(fname).ToLower();
            if (ext.Length > 1) {
                ext = ext.Substring(1);
            }
            string mime = "";
            Console.Error.WriteLine(ext);
            if (map.TryGetValue(ext, out mime)) {
                Console.WriteLine(mime);
            } else {
                Console.WriteLine("UNKNOWN");
            }
        }

        // To debug: Console.Error.WriteLine("Debug messages...");
    }
}
