package com.jesse.pinkman;

public class pattern3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int space=3;
		int star=0;
		
		for (int i = 0; i < 5; i++) {
			
			for (int j = 0; j <=space ; j++) {
				
				System.out.print(" ");
			}
			for (int k= 0; k<= star; k++) {
				
				System.out.print("*");
			}
			
			
			System.out.println();
			space--;
			star++;
			
		}
		
		
		
		
	}

}
