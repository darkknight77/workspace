package com.t3xas;

public class Test1 {

  public static void main(String[] args) {
  
   int[] x={1,9,5,4,6,5};
  
 int i=0,j=0;
/*  String s="x[i]+x[j]";
 
   System.out.println(s);
   int one=x[i];
   int two=x[j];
   int three=0;
   for (int k = 2; k < x.length; k++) {
	
	   three=three+x[i+k];
	   break;
}
*/   
 
   
  for( i=0;i<=x.length;i++){
	 // System.out.println("new");
	  //System.out.println();
  //System.out.println("i:"+i);
  for( j=i+1;j<x.length;j++){
	 // System.out.println("j:"+j);
  
 
	// System.out.println("k:"+k);
  if(x[i]+x[j]==10){
   
         System.out.println("{"+x[i]+","+x[j]+"}");
         
 }
  int k=j+1;
  if( k<x.length-1){
  if(x[i]+x[j]+x[k]==10){
   
         System.out.println("{"+x[i]+","+x[j]+","+x[k]+"}");
         
 }
  
 }
 
  }
  
 /* if(i==x.length-1&&j==x.length)
  {
	  i=-1;
	  j=i+1;
	  
	  
	  System.out.println("break");
	  
  }
*/  
  
  
  }
  }

}