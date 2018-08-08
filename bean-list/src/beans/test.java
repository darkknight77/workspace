package beans;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		ApplicationContext a= new ClassPathXmlApplicationContext("resources/Spring.xml");
		car c=(car) a.getBean("c");
		c.printcardata();
		//System.out.println("this");
	}

}
