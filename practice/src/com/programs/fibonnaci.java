package com.programs;

public class fibonnaci {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*first 10 Fibonacci numbers are 1, 1, 2, 3, 5, 8, 13, 21, 34, 55*/
		int a=0,b=1;
		int c=1;
		System.out.println("1 ");
		while(c<50){
		
		
		c=a+b;
		System.out.println(c);
		
		a=b;
		b=c;
		}

	}

}
