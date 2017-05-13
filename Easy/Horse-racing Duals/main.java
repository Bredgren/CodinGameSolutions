import java.util.*;
import java.io.*;
import java.math.*;

class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();

        ArrayList<Integer> strengths = new ArrayList<Integer>();
        for (int i = 0; i < N; i++) {
            int pi = in.nextInt();
            strengths.add(pi);
        }

        Collections.sort(strengths);

        int min = strengths.get(1) - strengths.get(0);
        for (int i = 0; i < strengths.size() - 1; i++) {
            int d = strengths.get(i + 1) - strengths.get(i);
            if (d < min) {
                min = d;
            }
        }

        System.out.println(min);
    }
}
