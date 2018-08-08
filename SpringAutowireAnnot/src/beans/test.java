package beans;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//String r[]=new String[]{"resources/car.xml","resources/engine.xml"};
		ApplicationContext ap= new ClassPathXmlApplicationContext("resources/Spring.xml");
		
		car c= (car) ap.getBean("c");
		c.printcardata();
	
	}

}
