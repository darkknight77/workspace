package com.jesse.pinkman;

public class fibonnaci {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/* first 10 Fibonacci numbers are 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 */

		int a = 1, b = 1,c;

		System.out.print(a+" "+b);
		
		for (int i = 0; i < 20; i++) {

			c=a+b;
			System.out.print(" "+c);
			a=b;
			b=c;
			
		}

	}

}
