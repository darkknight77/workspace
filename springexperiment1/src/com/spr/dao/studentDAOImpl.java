package com.spr.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spr.model.student;

@Repository
public class studentDAOImpl implements studentDAO{
	
	@Autowired
	private SessionFactory sessionFactory; 

	@Override
	public void addstudent(student student1) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(student1);
		
	}

	@SuppressWarnings("unchecked")
	public List<student> getAllstudents() {
		// TODO Auto-generated method stub
		
		return sessionFactory.getCurrentSession().createQuery("FROM student").list();
	}

	@Override
	public void deletestudent(Integer employeeId) {
		// TODO Auto-generated method stub

		student student1=(student)sessionFactory.getCurrentSession().load(student.class,employeeId);
	    
		if(student1 !=null){
		sessionFactory.getCurrentSession().delete(student1);
		}
		
	}

	@Override
	public student updatestudent(student student1) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(student1);
		//sessionFactory.openSession().update(student1);
		return student1;
	}

	
	public student getstudent(int employeeid) {
		// TODO Auto-generated method stub
		student stu=sessionFactory.getCurrentSession().load(student.class, employeeid);
		
		return stu;
	}

}
