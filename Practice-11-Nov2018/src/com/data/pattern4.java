package com.data;

public class pattern4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n=5;
		int s=0;
		
		for (int i = 0; i < 5; i++) {
		
			
			for (int j = 0; j < s; j++) {
				System.out.print(" ");
				
			}
			
			for (int j = 0; j < n; j++) {
				
				System.out.print("*");
			}
			s++;
			n--;
			System.out.println();
		}
		
		
		
	}

}
