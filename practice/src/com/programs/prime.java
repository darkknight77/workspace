package com.programs;

public class prime {

	public static void main(String[] args) {
		
		
		
		boolean prime;
		for (int i = 2; i < 100; i++) {
			prime=true;
			for (int j = 2; j < 10; j++) {
				
				
				if(i!=j)
				{
				  if(i%j==0)
				  {
					  prime =false;
					  break;
				  }
					
				}
				
				
				
			}
			
			if(prime)
			{
				System.out.println(i);
			}
			
		}	
			
		
		
		
		
		
		
		
		// TODO Auto-generated method stub
/*
		boolean prime;
		for (int i = 2; i < 100; i++) {
			prime =true;
			for (int j = 2; j < 10; j++) {
				
				
				if(i!=j)
				{
					if(i%j==0)
					{
					    prime=false;	
						break;
					}
					
				}
				
				
			}
			
			if(prime)
			 
			{
			  System.out.println(i);
			 }
		}
		
		*/
	}

}
