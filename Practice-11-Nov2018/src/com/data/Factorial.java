package com.data;

public class Factorial {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n=5;
		int factorial = 1;
		
		while(n>1)
		{
			
			factorial*=n*(n-1);
			System.out.println("e: "+factorial);
			n-=2;
		}
		System.out.println(factorial);
		
	}

}
