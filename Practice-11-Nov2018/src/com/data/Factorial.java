package com.data;

public class Factorial {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n = 10;
		int factorial = 1;

		while (n > 1) {

			factorial *= n * (n - 1);
			n -= 2;
		}
		System.out.println(factorial);

	}

}