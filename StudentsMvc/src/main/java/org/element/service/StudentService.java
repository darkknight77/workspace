package org.element.service;

import java.util.List;

import org.element.dao.StudentDao;
import org.element.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {
	@Autowired
	StudentDao studentdao;

	
public List<Student> getstudents() {
		
	List<Student> students=studentdao.getstudents();		

	return students;
}
	
	public void addstudent(Student student) {

		studentdao.addstudent(student);

	}
	
	public void updatestudent(Student student) {
		// TODO Auto-generated method stub

		studentdao.updatestudent(student);

	}
	public Student  getstudent(int id)
	{
		Student student=studentdao.getstudent(id); 
		
		return student;
	}

	public void deletestudent(int id) {
		// TODO Auto-generated method stub

		studentdao.deletestudent(id);

	}

}
