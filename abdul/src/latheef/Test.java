package latheef;

import java.io.BufferedReader;
import java.io.InputStreamReader;

class x {

public void show()
{
	System.out.println("show in x");
	}	
	
}

public class Test extends x {
	
	
	public void show()
	{
		System.out.println("show in test");
		}	
	
	public static void main(String[] args) {
	
		Test t= new Test();
		t.show();
		x x1= new x();
		x1.show();
		x x2=  new Test();
		x2.show();
		
	}
}
