package org.element.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.element.configuration.BeanConfig;
import org.element.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao {
    @Autowired
	private SessionFactory sf;
	
   
	public List<Student> getstudents()
	{
		Session s=null;
		List<Student> students=null;
		try {
			s=sf.openSession();
			
		students=s.createQuery("From STU_DATA").list();	
			
		} 
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return students;
		
	}


	public void addstudent(Student student) 
	{
		
	try {
		sf.getCurrentSession().saveOrUpdate(student);
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	}
		
		
		
	}

