package com.t3xas;

public class tester {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
	//String temp = "abdullathiabdul";//aaaa,abab
	String temp ="rolayreelrolay";
    char[] charArr = temp.toCharArray();
    int maxLength=-1;
    for (int i = 1; i < charArr.length; i++) {
    	System.out.println("When i is "+i);
        boolean charMatched = true;
        for (int j = 0; j < i; j++) {
        	System.out.println("When j is "+j);
        	System.out.println(charArr[j]+""+charArr[charArr.length - i + j]);
            
            if(charArr[j] != charArr[charArr.length - i + j]){
            	charMatched = false;
            	System.out.println("false---------------");
            }
        }
        if(charMatched){
            maxLength = i;
            System.out.println("true............................");
        }
    }
    if(maxLength > -1){
        System.out.println("max lengt suffix prefix: "+maxLength);
    } else {
        System.out.println("not found");
    }
	
}

}
