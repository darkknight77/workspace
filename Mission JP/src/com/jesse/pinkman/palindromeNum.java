package com.jesse.pinkman;

public class palindromeNum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n=758;
		int temp=n;
		int r,s=0;
		while(n>0)
		{
			r=n%10;
			n=n/10;
			s=s*10+r;
			
		}
		
		if(temp==s)
		{
			System.out.println(s+" is palindrome");
		}
		else
		{
			System.out.println(s+" is not palindrome");
		}
	}

}
