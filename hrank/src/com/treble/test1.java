package com.treble;

import java.util.Scanner;

public class test1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner in = new Scanner(System.in);
		int t = in.nextInt();

		while (t > 0) {
			int a = in.nextInt();
			int b = in.nextInt();
			int n = in.nextInt();
			int x = (int) (a + (b * (Math.pow(2, 0))));
			System.out.print(x + " ");

			for (int j = 1; j < n; j++) {
				x += (int) ((Math.pow(2, j)) * b);
				System.out.print(x + " ");

			}

			System.out.println();
			t--;
		}

	}

}
