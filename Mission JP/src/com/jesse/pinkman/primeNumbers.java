package com.jesse.pinkman;

public class primeNumbers {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		boolean prime=true;
		int i,j;
		for (i = 2; i < 100; i++) {
			
			prime=true;
			for (j = 2; j < i-1; j++) {
				
				if(i%j==0)
				{
					prime=false;
					break;
				}
				
			}
			
			if(prime)
			{
				System.out.println(i);
			}
			
		}
		
		
	}
}
