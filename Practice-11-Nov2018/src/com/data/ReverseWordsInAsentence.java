package com.data;

public class ReverseWordsInAsentence {

	
	private static void ReverseWordsInAsentence(String s) {
		// TODO Auto-generated method stub
      
		String[] words=s.split(" ");
		String reversedSentence="";
		for (int i = 0; i < s.length(); i++) {
			
			String word=words[i];
			String reverseword="";
			
			for (int j = word.length()-1; j >=0; j--) {
				
				reverseword=reverseword+word.charAt(j);
				
				System.out.println("rw "+reverseword);
			}
			
			reversedSentence=reversedSentence+reverseword;
			System.out.println("rs "+reversedSentence);
		}
		
		
	}
	
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ReverseWordsInAsentence("What the Fuck Man !!! ");
		
		
	}

}
