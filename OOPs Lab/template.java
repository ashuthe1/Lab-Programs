import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Random;
import java.util.StringTokenizer;

public class F1 {

	public static void main(String[] argc) {
		FastScanner fs = new FastScanner();
		PrintWriter out = new PrintWriter(System.out);
		int T = 1;
        // T = fs.nextInt();
		for (int tt = 0; tt < T; tt++) {
			
		}
		out.close();
	}

	static final int mod = 1_000_000_007;

	static long add(long a, long b) {
		return (a + b) % mod;
	}

	static long sub(long a, long b) {
		return ((a - b) % mod + mod) % mod;
	}

	static long mul(long a, long b) {
		return (a * b) % mod;
	}

	static long exp(long base, long exp) {
		if (exp == 0)
			return 1;
		long half = exp(base, exp / 2);
		if (exp % 2 == 0)
			return mul(half, half);
		return mul(half, mul(half, base));
	}

	static long[] factorials = new long[2_000_001];
	static long[] invFactorials = new long[2_000_001];

	static void precompFacts() {
		factorials[0] = invFactorials[0] = 1;
		for (int i = 1; i < factorials.length; i++)
			factorials[i] = mul(factorials[i - 1], i);
		invFactorials[factorials.length - 1] = exp(factorials[factorials.length - 1], mod - 2);
		for (int i = invFactorials.length - 2; i >= 0; i--)
			invFactorials[i] = mul(invFactorials[i + 1], i + 1);
	}

	static class FastScanner {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer("");

		String next() {
			while (!st.hasMoreTokens())
				try {
					st = new StringTokenizer(br.readLine());
				} catch (IOException e) {
					e.printStackTrace();
				}
			return st.nextToken();
		}
        public String nextLine() throws IOException { return br.readLine();}
		int nextInt() {
			return Integer.parseInt(next());
		}

		int[] readArray(int n) {
			int[] a = new int[n];
			for (int i = 0; i < n; i++)
				a[i] = nextInt();
			return a;
		}

		long nextLong() {
			return Long.parseLong(next());
		}
	}

}
