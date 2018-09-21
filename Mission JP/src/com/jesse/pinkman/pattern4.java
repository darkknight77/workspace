package com.jesse.pinkman;

public class pattern4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int space=0;
		int star=5;
		
		for (int i = 0; i < 5; i++) {
			

			for (int k = 0; k < space ; k++) {
				System.out.print(" ");
			}
			
			
			for (int j = 0; j < star ; j++) {
				
				System.out.print("*");
			}
			
			System.out.println();
			space++;
			star--;
			
		}
		
		
	}

}
