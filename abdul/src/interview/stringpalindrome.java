package interview;

public class stringpalindrome {

	public static void main(String[] args) {
		String str="radaR";
		String rev="";
		
		for(int i=str.length()-1;i>=0;i--)
		{
			rev=rev+str.charAt(i);
		}
	System.out.println(rev);	
	
	
	
	/*	
		String str= "radaR";
		char[] rev =str.toCharArray();
	for (int i = rev.length-1; i >=0; i--) {
		System.out.println(rev[i]);
	}*/
		
	}
		
		
	
}
