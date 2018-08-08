package Test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import beans.Test;

public class Client {

	public static void main(String[] args) {
		
		/*Resource r= new ClassPathResource("resources/Spring.xml");
		BeanFactory bf=new XmlBeanFactory(r);
		*/
		//ApplicationContext context= new FileSystemXmlApplicationContext("C:/Users/Latheef/workspace/bean/src/resources/Spring.xml");
	
		ApplicationContext context  = new ClassPathXmlApplicationContext("resources/Spring.xml");
		Test t=(Test) context.getBean("t");
		//Test t1=(Test) context.getBean("t");
		
	t.hello();
	
	}
	
}
