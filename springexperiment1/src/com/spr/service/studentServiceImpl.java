package com.spr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spr.dao.studentDAO;
import com.spr.model.student;
@Service
@Transactional
public class studentServiceImpl implements studentService {
	
    @Autowired
	studentDAO studentdao;
    
	@Override
	@Transactional
	public void addstudent(student student1) {
		// TODO Auto-generated method stub
		studentdao.addstudent(student1);
		
	}

	@Override
	@Transactional
	public List<student> getAllstudents() {
		// TODO Auto-generated method stub
		return studentdao.getAllstudents();
	}

	@Override
	@Transactional
	public void deletestudent(Integer employeeId) {
		// TODO Auto-generated method stub
		
		studentdao.deletestudent(employeeId);
	}

	@Override
	@Transactional
	public student updatestudent(student student1) {
		// TODO Auto-generated method stub
		return studentdao.updatestudent(student1);
	}

	@Override
	public student getstudent(int employeeid) {
		// TODO Auto-generated method stub
		return studentdao.getstudent(employeeid);
	}

}
