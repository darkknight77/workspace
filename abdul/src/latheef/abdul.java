package latheef;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

class dd {
	
	public static int x=10;
	
	 void fun() {

      System.out.println("A.fun()");
   }
}
 
class B extends dd {
  void fun() {  
      System.out.println("B.fun()");
   }
  public void m() {
		// TODO Auto-generated method stub
System.out.println(super.x);
	}
	
}
public class abdul {
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	int []a={1,1,1,1,2,2,3,4,1};
	
	int [] aaaa = new int[a.length];
	
    	
	for (int i = 0; i < a.length; i++) {
		int count=0;
		for (int h = 0; h < aaaa.length; h++) {
			if(aaaa[h] ==a[i]){
				continue;
			}
		}
		for (int j = 0; j < a.length; j++) {
			aaaa[i]=a[i];
			if(a[i]==a[j]){
				count++;
			}
			
		}
		
		System.out.println(a[i] +"-"+count);
		
	}
	
	
	
	}

}
