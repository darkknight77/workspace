package com.data;

public class palindrome {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n = 392, r, s = 0;
		int k = n;
		while (n > 0) {
			r = n % 10; //
			n = n / 10; //
			s = s * 10 + r; //

		}

		if (s == k) {
			System.out.println("pal");
		} else {
			System.out.println("not");
		}
	}

}
