package com.data;

public class primenumbers {

   static	boolean prime=true;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		for (int i = 1; i < 100; i++) {
			
			for (int j = 2; j < i/2; j++) {
				
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
