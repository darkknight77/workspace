package com.data;

public class PowerOfNumber {
	 static int output = 1;
	public static int power(int num,int power)
	{
		
	while(power>1)
	{
		output*= num*num;
		power-=2;
		
	}	
	  
		
		return output;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println(power(356, 4));
		
		
	}

}
