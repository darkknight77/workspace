package org.element.dao;

import javax.transaction.Transactional;

import org.element.configuration.BeanConfig;
import org.element.model.StudentModel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao {
    @Autowired
	private SessionFactory sf;
	
    Session s;
	public StudentModel psv() {
		// TODO Auto-generated method stub
		StudentModel sm = new StudentModel();
		/*
		s.setSname("Swami Vivekananda");
		s.setPercentage(75);
		s.setUniversity("ABIDS");
		
		sf.getCurrentSession().saveOrUpdate(s);*/
		
		s=sf.openSession();
		sm=s.get(StudentModel.class, new Integer(2));
		
		return sm;
		
		
		
	}
}
