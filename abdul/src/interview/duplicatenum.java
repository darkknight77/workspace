package interview;

import java.util.ArrayList;

public class duplicatenum {

  public static	void dupnum(ArrayList al)
  {
	
	  int n=al.size()-1;
	  int total=getsum(al); 
	  int duplicatenumber=total-((n*(n+1))/2);
	  System.out.println("dn is "+duplicatenumber);
  }
  
  static int getsum(ArrayList<Integer> al)
  {
	  int total=0;
	 for(int x:al)
	 {
		 total+=x;
	 }
	  
	  return total;
  }
	
	public static void main(String[] args) {
		
		
		ArrayList<Integer> al= new ArrayList<>();
		
		for (int i = 1; i <= 20; i++) {
			al.add(i);	
		}

		al.add(15);
		System.out.println(al.size());
		
		
		dupnum(al);
		
		
	}
	
	
}


