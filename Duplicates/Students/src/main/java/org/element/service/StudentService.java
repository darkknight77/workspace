package org.element.service;

import org.element.dao.StudentDao;
import org.element.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class StudentService {
    @Autowired
	StudentDao studentDao;
	
	public void deletestudent(int id) {
		// TODO Auto-generated method stub

		studentDao.deletestudent(id);
		

	}

	
	
	
}
