package com.data;

public class ReverseAnumber {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n=1235678;
		int r=0;
		int x=0;
		while(n>0)
		{
			r=n%10;
			//System.out.println(r);
			n=n/10;
			//System.out.println(n);
			x=x*10+r;
			//System.out.println(x);
			
		}
		System.out.println(x);
		
	}

}
