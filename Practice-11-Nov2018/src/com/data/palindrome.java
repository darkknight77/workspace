package com.data;

public class palindrome {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n = 392, r, s = 0;
		int k = n;
		while (n > 0) {
			r = n % 10; //2 9 3
			n = n / 10; //39 3 0
			s = s * 10 + r; //2 29 293

		}

		if (s == k) {
			System.out.println("pal");
		} else {
			System.out.println("not");
		}
	}

}
