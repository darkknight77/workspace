package com.programs;

import java.util.ArrayList;

public class dupnum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ArrayList<Integer> al=new ArrayList<>();
		
		for (int i = 1; i <=20; i++) {
			
			al.add(i);
			
		}
		al.add(20);
		
		int sum=0;
		for(int x:al)
		{
			sum=sum+x;
		}
		
		System.out.println("sum "+sum);
		
		int total;
		int n=al.size()-1;
		System.out.println(n);
		total=20*(21)/2;
		
		System.out.println(total);
		
		int dup=sum-total;
		
		System.out.println(dup);
	}

}
