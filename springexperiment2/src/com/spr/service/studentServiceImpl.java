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
	private studentDAO sdao;
    
	@Override
	@Transactional
	public void addstudent(student student1) {
		// TODO Auto-generated method stub
		sdao.addstudent(student1);
		
	}

	@Override
	@Transactional
	public List<student> getAllstudents() {
		// TODO Auto-generated method stub
		return sdao.getAllstudents();
	}

	@Override
	@Transactional
	public void deletestudent(Integer employeeId) {
		// TODO Auto-generated method stub
		
		sdao.deletestudent(employeeId);
	}

	@Override
	public student updatestudent(student student1) {
		// TODO Auto-generated method stub
		return sdao.updatestudent(student1);
	}

	@Override
	public student getstudent(int employeeid) {
		// TODO Auto-generated method stub
		return sdao.getstudent(employeeid);
	}

}
