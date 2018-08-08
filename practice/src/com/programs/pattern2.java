package com.programs;

public class pattern2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int l=0;
		int star=1;
		for (int i = 0; i < 5; i++) {
			
			for (int j = 5; j > l; j--) {
				
				System.out.print(" ");
				
			}
			
			for (int k = 0; k < star; k++) {
				
				System.out.print("*");
			}
			
			
			System.out.println();
			l++;
			star++;
		}
		
		
		
		
	}

}
