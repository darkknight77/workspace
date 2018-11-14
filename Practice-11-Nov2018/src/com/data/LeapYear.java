package com.data;

public class LeapYear {

	
	public static boolean isLeapYear(int year)
	{
		boolean flag = false;
		if(year % 400==0)
		{
			flag = true;
		}
		else if(year % 100 == 0)
		{
			flag = false;
		}
		else if(year % 4 == 0)
		{
			flag = true;
		}
		
		
		if(flag)
		{
			return true;
		}
		
		return false;
	}
	
	
	
	public static void main(String[] args) {
		
      System.out.println(isLeapYear(1997));
		
	}
	
}