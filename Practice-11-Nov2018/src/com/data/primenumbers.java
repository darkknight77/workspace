package com.data;

public class primenumbers {

	static boolean prime = true;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61,
		// 67, 71, 73, 79, 83, 89, 97

		for (int i = 2; i < 100; i++) {
            prime=true;
			for (int j = 2; j < i/2; j++) {

				if (i % j == 0) {
					prime = false;
					break;
				}

			}

			     if (prime) {
				System.out.println(i);
			    }
		
		
		
		
		}

	}

}
