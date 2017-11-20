import java.util.*;
import java.io.*;
import java.math.*;


class Solution {
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int numElems = in.nextInt();
        int numFiles = in.nextInt();
        HashMap<String, String> mime= new HashMap<String, String>();
        for (int i = 0; i < numElems; i++) {
            String ext = in.next();
            String mt = in.next();
            mime.put(ext.toLowerCase(), mt);
        }
        in.nextLine();
        for (int i = 0; i < numFiles; i++) {
            String fname = in.nextLine();
            int dot = fname.lastIndexOf('.');
            if (dot < 0) {
                 System.out.println("UNKNOWN");
                 continue;
            }
            String ext = fname.substring(dot+1).toLowerCase();
            System.out.println(mime.getOrDefault(ext, "UNKNOWN"));
        }
        // To debug: System.err.println("Debug messages...");
    }
}


/*
import java.util.*;
import java.io.*;
import java.math.*;

class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int types_n = in.nextInt();
        int files_n = in.nextInt();

        Map<String, String> map = new HashMap<String, String>();

        for (int i = 0; i < types_n; i++) { map.put(in.next().toLowerCase(), in.next()); in.nextLine(); }
        
        for (int i = 0; i < files_n; i++)
        {
            String FNAME = in.nextLine().toLowerCase(); // One file name per line.
            int dotI = FNAME.lastIndexOf(".");
            String ext = dotI == -1 ? "" : FNAME.substring(dotI+1);
            System.out.println(map.containsKey(ext) ?  map.get(ext) : "UNKNOWN");
        }
    }
}
*/
