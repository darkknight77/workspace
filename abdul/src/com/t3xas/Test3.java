package com.t3xas;

public class Test3 {
	
	
	public static int postfixstarterchecker(char[] c,int m)
	{
		int k=0;
		outer:for (int i = 0; i < c.length; i++) {
			
			inner:for (int j = m; j <c.length; j++) {
				
				if(c[i]==c[j]&&c[j]==c[j]&&c[i+2]==c[i+2]){
				
				
					k=j;	
					break outer;
				
				
				
				}
			}
		
			
		}
	return k;		
	}
	
	
	public static String prefix(String s,int k)
	
	{
		String prefix="";
		char[] c=s.toCharArray();
		int i=0;
		for ( i = 0; i < k; i++) {
			
			prefix=prefix+c[i];
	//	System.out.println("prefix: "+prefix);
			
			
			
		}
		return prefix;
	
	}
	
	
public static String postfix(String s,int k)
	
	{
		String postfix="";
		char[] c=s.toCharArray();
		int j=1;
		for ( j = k; j < c.length; j++) {
			
			postfix=postfix+c[j];
		//System.out.println("postfix: "+postfix);
			
	}
		return postfix;
	}
	
	

	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//String s="shaikabdulshaiklatheefshaikabdul";
		//String s="rahulkillsrahul";
		String s="abdulkillsabdul";
		System.out.println("input :"+s);
		char[] c=s.toCharArray();
		int i=0;
		int j=i+1;
				
		int k=postfixstarterchecker(c,j);
		System.out.println("k is "+k);
		int k1=1;
		System.out.println(prefix(s, k));
		System.out.println(postfix(s, k));
		
		
			System.out.println("pe:"+prefix(s, k));
			System.out.println("po:"+postfix(s, k));
			
		
		
		
		
		
	//	System.out.println("pre:"+prefix(s, k));
		//System.out.println("post:"+postfix(s, k));
		
		
		String pre=prefix(s, k);
		String pos=postfix(s, k);
		
		
		
		System.out.println(pre.contains(pos));
		if(pre.contains(pos)){
	//		System.out.println("pre con pos");
		pre=pos;
		}
		if(pos.contains(pre))
		{
		//	System.out.println("pos con pre");
			
			pos=pre;
		}
		if(pre.equals(pos))
        {
          
			
        System.out.println("output is: "+pre);
        
        }
		 
		
		
	
		
	}

}