package com.treble;

import java.util.Calendar;
import java.util.Scanner;

public class test {

	public static void main(String[] args) {
		

	// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
        System.out.println("================================");
        
            String s1="java";
            String s2="cpp";
            String s3="python";
            String s[]={s1,s2,s3};
            int x1=100;
            int x2=65;
            int x3=50;
            int x[]={x1,x2,x3};
            //Complete this line
        
            for (int i = 0; i < 3; i++) {
				//System.out.printf("%-15s%03d%n",s[i],x[i]);
				System.out.printf("%05d%15s%n",x[i],s[i]);
			}
        
        System.out.println("================================");

	}

}
