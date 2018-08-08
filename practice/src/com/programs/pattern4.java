package com.programs;

public class pattern4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		int s=4,l=1;
		for (int i = 1; i <=5; i++) {
			
			for (int j = 1; j <=s; j++) {
				
				System.out.print(" ");
			}
			
			for (int k = 0; k < l; k++) {
				System.out.print("*");
			}
			
			System.out.println();
			l+=2;
			s--;
			
		}
		
	}

}
