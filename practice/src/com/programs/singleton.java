package com.programs;

public class singleton {

	private static singleton myobj;
	
	static
	{
		myobj=new  singleton();
	}
	
	private singleton()
	{
		
	}
	
	public static singleton myobject()
	{
		return myobj;
		
	}
	
	public void m()
	{
		System.out.println("singleton");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		singleton sl=myobject();
		sl.m();
		
	}

}
