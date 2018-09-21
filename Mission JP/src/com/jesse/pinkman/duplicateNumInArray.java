package com.jesse.pinkman;

import java.lang.reflect.Array;

public class duplicateNumInArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		int[] a= new int[]{1,2,3,4,5,6,7,8,9,10,5};
		
          for (int i = 0; i < a.length; i++) {
			
        	  for (int j = i+1; j < a.length; j++) {
				
        		  if(a[i]==a[j])
        		  {
        			  System.out.println("Duplicate Number is "+a[i]);
        		  }
        		  
        		  
			}
        	  
		}
	
		
	}

}
