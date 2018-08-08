package beans;

import org.omg.CORBA.portable.ApplicationException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class client {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext ap= new ClassPathXmlApplicationContext("resources/Spring.xml");
		test t=(test)ap.getBean("t");
		t.printdata();
		
		
	}

}
