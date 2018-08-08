package beans;

import java.util.Calendar;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {
	
private static test t;

private	test()
	{
		System.out.println("test");
	}

public static test getInstance()
{
	if(t==null)
	{
		t=new test();
		
	return t;
	}
	else
	{
     return t;	
    }
}
	@Override
		protected Object clone() throws CloneNotSupportedException {
			// TODO Auto-generated method stub
	throw new CloneNotSupportedException();		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext ap= new ClassPathXmlApplicationContext("resources/Spring.xml");
		test t=(test) ap.getBean("t");
		test t1=(test) ap.getBean("t");
	System.out.println(t1==t);
	
	}

}
