package com.data;

public class fibonnaciRecursion {

	static int a=0,b=1,c=1;	

	private static void fibonnaci(int count) {
	// TODO Auto-generated method stub
      if(count>0){
		c=a+b;
		System.out.print(" "+c);
		a=b;
		b=c;
		fibonnaci(count-1);
	
   }
}
	
	
	public static void main(String[] args) {
		// 0, 1, 1, 2, 3, 5, 8, 13, 21
		
		System.out.print(a+" "+b);
		fibonnaci(8);
		
	}

}
