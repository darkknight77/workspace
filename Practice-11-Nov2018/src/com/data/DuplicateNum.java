package com.data;

public class DuplicateNum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] a = {1,14,13,24,31,45,56,67,78,56};
		
		for (int i = 0; i < a.length; i++) {
			System.out.println("Duplicates: ");
			for (int j = i+1; j < a.length; j++) {
				
				if(a[i]==a[j])
				{
					System.out.println(a[i]);
				}
				
			}
		}
	}

	
}
