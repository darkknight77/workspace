package com.pack;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext ap= new ClassPathXmlApplicationContext("resources/player.xml");
		player p=(player) ap.getBean("p");
		p.printdata();
		
		
	}

}
