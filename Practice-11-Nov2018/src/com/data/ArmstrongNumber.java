package com.data;

public class ArmstrongNumber {

	
	public static String isArmstrong(int num)
	{
		int c=0;
		while(num > 0)
		{
			int a= num%10;
			System.out.println(a);
			num = num/10;
			System.out.println(num);
			c = c+(a*a*a);
	        System.out.println(c);		
		
			
		}
		
		return " ";
	} 
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		isArmstrong(153);
		
		
	}

}
