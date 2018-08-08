package com.programs;

public class evnodd {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("even");
		for (int i = 1; i < 100; i++) {
			

			if (i % 2 == 0) {
				System.out.print(i +" ");
			}
		}

		System.out.println();
		System.out.println("odd");
		for (int i = 1; i < 100; i++) {
		
			
			if (i % 2 != 0) {
				System.out.print(i+" ");
			}
		}

	}

}
