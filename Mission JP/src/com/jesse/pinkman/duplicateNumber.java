package com.jesse.pinkman;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class duplicateNumber {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		List<Integer> al = new ArrayList<>();

		for (int i = 1; i <= 20; i++) {
			al.add(i);
		}

		al.add(15);

	int sum=0;
	
	for (Integer integer : al) {
		sum+=integer;
	}
	System.out.println("Sum is "+sum);
	
	int n=al.size();
	
	int dup=sum-(n*(n-1)/2);
	System.out.println("Dup is "+ dup);
	
	}

}
