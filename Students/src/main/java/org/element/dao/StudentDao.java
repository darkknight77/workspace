package org.element.dao;

import javax.transaction.Transactional;

import org.element.configuration.BeanConfig;
import org.element.model.StudentModel;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class StudentDao {
    @Autowired
	private SessionFactory sf;
	
	public void psv() {
		// TODO Auto-generated method stub
		StudentModel s = new StudentModel();
		//s.setId(101);
		s.setSname("Ramanuja");
		s.setPercentage(65);
		s.setUniversity("JNTU");
		
		
		
		
		
		
	}
}
