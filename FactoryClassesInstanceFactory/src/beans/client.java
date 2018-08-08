package beans;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class client {

	public static void main(String[] args) throws Exception {
		ApplicationContext ap=new ClassPathXmlApplicationContext("resources/Spring.xml");
		car c=(car) ap.getBean("c");
		c.drive();
	}
	
}
