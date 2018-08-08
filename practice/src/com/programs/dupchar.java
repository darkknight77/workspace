package com.programs;

public class dupchar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String s="rrrruffxcfvhhvf";
	
		for (int i = 0; i <=s.length()-1; i++) {
			int counter=1;
			for (int j = i+1; j <=s.length()-1; j++) {
				
				
			if(s.charAt(i)==s.charAt(j))
			{
				counter++;
				//System.out.println(s.charAt(i));
				
						
					
				
			}
			//System.out.println(s.charAt(i)+"--->"+counter);
			
			if(j==s.length()-1){
				System.out.println(s.charAt(i)+"--->"+counter);
			   
			 for (int k = i+1; k < s.length()-1; k++) {
				
			
				if(s.charAt(i)==s.charAt(k))
			   {
				   i++;
			   }
			
			}
			}//System.out.print(s.charAt(i));
		}
	
	}
		}

}
