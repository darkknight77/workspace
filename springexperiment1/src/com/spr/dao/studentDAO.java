package com.spr.dao;

import java.util.List;

import com.spr.model.student;



public interface studentDAO {
	
	 public void addstudent(student student1);
	 
	    public List<student> getAllstudents();
	 
	    public void deletestudent(Integer employeeId);
	 
	    public student updatestudent(student student1);
	 
	    public student getstudent(int employeeid);

}
