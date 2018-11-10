package com.data;

public class fibonnaci {

	public static void main(String[] args) {
		// 0, 1, 1, 2, 3, 5, 8, 13, 21

		int a = 0, b = 1, c = 1;
		System.out.print(a +" "+ b+" ");
		while (c < 25) {
			c = a + b;
			System.out.print(c + " ");
			a = b;
			b = c;
		}
	}
}
