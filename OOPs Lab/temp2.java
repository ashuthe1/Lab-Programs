// Main.java

import java.util.*;
import java.io.*;
import java.util.AbstractMap.SimpleEntry;
import java.math.*;

public class Main {
    static boolean isTakeTestCase = true;
    static final long mod = (long)(1e9 + 7);
    static ModuloArithmetic ma = new ModuloArithmetic();

    private void solve(Printer out, int testcase) throws Exception {

    }
    }
    // here is helper solve method
    public void solve() throws Exception {
        out = new Printer();
        int t = 1;
        if (isTakeTestCase) t = scanner.nextInt();
        for (int i = 0; i < t; i++) {
            solve(out, i);
        }
        // out.printTime();
        out.out.close();
    }

    // here is main method
    public static void main(String[] args) throws Exception {
        Main Main = new Main();
        Main.solve();
    }

    // constructor
    Main() {
        scanner = new FastScanner();
    }

    FastScanner scanner;
    Printer out;
    static class FastScanner {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer("");
        public String next() {
            while (!st.hasMoreTokens())
                try {
                    st = new StringTokenizer(br.readLine());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            return st.nextToken();
        }
        public int nextInt() {
            return Integer.parseInt(next());
        }
        public long nextLong() {
            return Long.parseLong(next());
        }
        public String nextLine() throws IOException { return br.readLine();}
        public int [] nextIntArray(int n) {
            int [] arr = new int[n];
            readIntArray(arr);
            return arr;
        }
        public long [] nextLongArray(int n) {
            long [] arr = new long[n];
            readLongArray(arr);
            return arr;
        }
        public String [] nextStringArray(int n) {
            String [] arr = new String[n];
            readStringArray(arr);
            return arr;
        }
        public void readIntArray(int arr[]) {
            for (int i = 0; i < arr.length; i++) arr[i] = nextInt();
        }
        public void readLongArray(long arr[]) {
            for (int i = 0; i < arr.length; i++) arr[i] = nextLong();
        }
        public void readStringArray(String arr[]) {
            for (int i = 0; i < arr.length; i++) arr[i] = next();
        }

    }

