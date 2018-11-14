package com.data;

public class ReverseAnumber {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n=123;
		int r=0;
		while(n>0)
		{
			r=n%10;
			System.out.println(r);
			n=n/10;
			System.out.println(n);
			r=r+n;
			System.out.println(r);
			
		}
		System.out.println(r);
		
	}

}
