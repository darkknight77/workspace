package com.data;

public class fibonnaci {

	public static void main(String[] args) {
		//0, 1, 1, 2, 3, 5, 8, 13, 21
	
	System.out.print("0 1 ");
	int a,b,c=1;
	 a=0;
	 b=1;
	while(c<25){
	
	 c=a+b;
	System.out.print(c+" ");
	a=b;
	b=c;
	}
}
}
