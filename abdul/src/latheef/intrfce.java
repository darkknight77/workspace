package latheef;

import abdul.interview;

interface z1
{
	public abstract void m1();
	void m2();
	default void  m5(){
	System.out.println("Knock Knock");
	}
	}
interface z extends z1
{
	void m3();
	void m4();
	}


public class intrfce implements z1,z{

	public void m1()
	{
		System.out.println("Hey fucker im m1");
	}
	
	public void m2()
	{
		System.out.println("Hey fucker im m2");
			
	}
	public void m3()
	{
		System.out.println("Hey fucker im m3");
		
	}
	public void m4()
	{
		System.out.println("Hey fucker im m4");
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		z1 z= new intrfce();
		
	}
	

}
