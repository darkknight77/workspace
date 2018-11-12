package com.data;

public class pattern5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int s = 3, n = 1;

		for (int i = 0; i < 5; i++) {

			for (int j = 0; j < s; j++) {
				System.out.print(" ");
			}
			for (int j = 0; j < n; j++) {
				System.out.print("*");
			}

			s--;
			n++;
			System.out.println();
		}

	}

}
