package com.spr.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spr.model.student;

@Repository
public class studentDAOImpl implements studentDAO{
	
	@Autowired
	private SessionFactory sF; 

	@Override
	public void addstudent(student student1) {
		// TODO Auto-generated method stub
		sF.getCurrentSession().saveOrUpdate(student1);
		
	}

	@SuppressWarnings("unchecked")
	public List<student> getAllstudents() {
		// TODO Auto-generated method stub
		
		return sF.getCurrentSession().createQuery("FROM Student").list();
	}

	@Override
	public void deletestudent(Integer employeeId) {
		// TODO Auto-generated method stub

		student student1=(student)sF.getCurrentSession().load(student.class,employeeId);
	    
		if(student1 !=null){
			sF.getCurrentSession().delete(student1);
		}
		
	}

	@Override
	public student updatestudent(student student1) {
		// TODO Auto-generated method stub
		sF.getCurrentSession().update(student1);
		return student1;
	}

	
	public student getstudent(int employeeid) {
		// TODO Auto-generated method stub
		student stu=(student) sF.getCurrentSession().load(student.class, employeeid);
		
		return stu;
	}

}
