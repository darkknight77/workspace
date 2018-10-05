package org.element.dao;

import javax.transaction.Transactional;

import org.element.configuration.BeanConfig;
import org.element.model.StudentModel;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao {
    @Autowired
	private SessionFactory sf;
	
	public void psv() {
		// TODO Auto-generated method stub
		StudentModel s = new StudentModel();
		
		s.setSname("Swami Vivekananda");
		s.setPercentage(75);
		s.setUniversity("ABIDS");
		
		sf.getCurrentSession().saveOrUpdate(s);
		
		
		
		
	}
}
