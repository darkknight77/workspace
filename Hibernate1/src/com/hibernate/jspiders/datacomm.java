package com.hibernate.jspiders;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class datacomm {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		student_info s=new student_info();
		s.setId(1);
	
		s.setSname("Sergio Mendes");
		s.setPhoneNumber("9039983933");
		
		Configuration c=new Configuration();
		c.configure();
	
		SessionFactory sf= c.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		ss.save(s);
		t.commit();
		ss.close();
		sf.close();
	}

}
