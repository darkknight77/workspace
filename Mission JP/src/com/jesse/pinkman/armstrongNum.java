package com.jesse.pinkman;

public class armstrongNum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 0, 1, 153, 370, 371, 407
		
		int n=407;
		int temp=n;
		int r,s=0;
		
		while(n>0)
		{
			r=n%10;
			n=n/10;
			s=s+r*r*r;
			
		}
		 
		if(temp==s)
		{
			System.out.println(temp+" is a Armstrong Number");
		}
		else
		{
			System.out.println(temp+" is not a Armstrong Number");
		}
		
	}

}
