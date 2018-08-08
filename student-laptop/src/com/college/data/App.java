package com.college.data;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class App  {
	Configuration cfg= new Configuration().configure("hibernate-cfg.xml").addAnnotatedClass(Laptop.class).addAnnotatedClass(Student.class);
	 SessionFactory sf = cfg.buildSessionFactory();
	 Session s;

	 public void transmit()
	 {
		 Laptop laptop= new Laptop();
			laptop.setLid(101);
			laptop.setLname("Dell");
			Student student= new Student();
			student.setRollno(1);
			student.setName("Navin");
			student.setMarks(50);
			//student.setLaptop(laptop);
		    student.getLaptop().add(laptop);
		    laptop.getStudent().add(student);
			
		    try {
				
			     s=sf.openSession();
			    Transaction tx = s.beginTransaction();
			    s.save(laptop);
			    s.save(student);
			    tx.commit();
			    System.out.println("skn");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally
		{
			s.close();
			sf.close();
System.out.println("closed");
		}	 
	 }
	 
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		App a= new App();
			a.transmit();
		
}
}