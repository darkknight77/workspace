package com.data;

public class palindrome {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n=252,r,s=0;
		int k=n;
		while(n>0)
		{
		r=n%10;
		n=n/10;
		s=s*10+r;
			
		}
		
		if(k==n)
		{
			System.out.println("pal");
		}
		else
		{
			System.out.println("not");
		}
	}

}
