package com.programs;

public class pattern3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int a=5,b=1,c=2;
		
		for (int i = 0; i < 5; i++) {
			
			for (int j = 0; j < a; j++) {
				System.out.print(" ");
				
			}
			
			for (int k = 0; k < b; k++) {
				System.out.print("* ");
			}
			
			for (int l = 0; l < 5; l++) {
				
				System.out.print(" ");
			}
			System.out.println();
			b++;
			a--;
			c--;
			
		}
		
		
	}

}
