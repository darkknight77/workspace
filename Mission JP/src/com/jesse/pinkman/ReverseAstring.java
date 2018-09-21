package com.jesse.pinkman;

public class ReverseAstring {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String s="madam";
		
		char[] c=s.toCharArray();
		
		for (int i = c.length-1; i >=0 ; i--) {
			
			System.out.print(c[i]);
			
		}
		
		
		
	}

}
