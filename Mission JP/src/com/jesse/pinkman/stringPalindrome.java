package com.jesse.pinkman;

public class stringPalindrome {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String s="radar";
		String rev="";
		char[] c=s.toCharArray();
		
		for (int i = c.length-1; i >=0; i--) {
			
			rev=rev+c[i];
			
		}
		
		if(rev.equals(s))
		{
			System.out.println(rev+" is a palindrome");
		}
		else
		{
			System.out.println(rev+" is not a palindrome");
			
		}
		
	}

}
