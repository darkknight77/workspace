package com.data;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class duplicateNumCount {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] a = { 1, 14, 78, 13, 78, 24, 31, 45, 56, 67,24, 78, 1, 56 };
		Set<Integer> s= new HashSet<>();
		System.out.println("Duplicates: ");
		for (int i = 0; i < a.length; i++) {
			int t = 1;
			for (int j = i + 1; j < a.length; j++) {
          
				if (a[i] == a[j]) {
                  t++;
				}
		
			}
			
			if(s.add(a[i]))
			{
				System.out.println(a[i]+" - "+t);
			}

			
			
		}
	}

}
