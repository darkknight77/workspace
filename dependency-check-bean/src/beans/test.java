package beans;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext context= new ClassPathXmlApplicationContext("resources/Spring.xml");
A a=(A) context.getBean("a");
		a.print();		
	}

}
