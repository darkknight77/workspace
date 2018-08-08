package com.programs;

public class palindrome {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n=212,r,s=0;
		int k=n;
		while(n>0)
		{
			r=n%10; //6
			System.out.println(r);
			n=n/10;  //65
			System.out.println(n);
			s=s*10+r; //6
			System.out.println(s);
			
			System.out.println();
			
		}
		
		if(k==s)
		{
			System.out.println("pal");
			
		}
		else
		{
			System.out.println("no");
		}
	}

}
