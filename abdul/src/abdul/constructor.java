package abdul;

public class constructor {
	
	static int id;
	String name;
	
	public  constructor(int i,String n) {
	
		id=i;
		// TODO Auto-generated constructor stub
	}
	
	public void m1(int i,String n)
	{
		id=i;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		constructor c= new constructor(10, "n");
System.out.println(id);
	}

}
