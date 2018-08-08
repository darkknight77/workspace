package com.t3xas;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class test4 {
	
	public static void main(String[] args) {
		
		String s="what the fuck what the hell";
		String[] j=s.split(" ");
		ArrayList<String> al= new ArrayList<>();
		/*for (String string : j) {
			System.out.println(string);
		}
		*/
		for (int i = 0; i < j.length; i++) {
			int count=1;
			for (int k = i+1; k < j.length; k++) {
				if(j[i].equals(j[k]))
				{
					//System.out.println("count++");
					count++;
					//System.out.println(j[i]+"------>"+count);
				}
			}
				if(al.contains(j[i]))
				{
				  }
				else
				{
					al.add(j[i]);
					 System.out.println(j[i]+"------>"+count);
					
				}
				
			}
			
		
		
	
		
		
		
	}

}
