package org.element.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.element.configuration.BeanConfig;
import org.element.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao {
	@Autowired
	private SessionFactory sf;

	public List<Student> getstudents() {
		
		List<Student> students = null;
		try {
			

			students = sf.getCurrentSession().createQuery("From STU_DATA").list();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return students;

	}

	public void addstudent(Student student) {

		try {
			sf.getCurrentSession().saveOrUpdate(student);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public void updatestudent(Student student) {
		// TODO Auto-generated method stub

		try {
			sf.getCurrentSession().saveOrUpdate(student);

		} catch (Exception e) {
			// TODO: handle exception
		}

	}
	
	
	public Student  getstudent(int id)
	{
		Student student=sf.getCurrentSession().get(Student.class, id); 
		
		return student;
	}
	
	
	public void deletestudent(int id) {
		// TODO Auto-generated method stub

		Student student=sf.getCurrentSession().get(Student.class,new Integer(id));
		
		sf.getCurrentSession().delete(student);

	}

}
