package com.data;

public class DuplicateNum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] a = {1,2,3,4,9,5,6,7,8,9};
		
		int sum=0;
		int n=a.length-1;
		int total=0;
		for (int i = 0; i < a.length; i++) {
			
			sum+=a[i];
			System.out.println(a[i]);
		}
		
		total=(n/2*(n+1))-sum;
		System.out.println(sum);
	}

	
}
