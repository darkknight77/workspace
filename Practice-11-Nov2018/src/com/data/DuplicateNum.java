package com.data;

public class DuplicateNum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] a = {1,2,3,4,5,6,7,8,9,5};
		
		int sum=0;
		for (int i = 0; i < a.length-1; i++) {
			
			sum+=a[i];
		}
		
		System.out.println(sum);
	}

}
