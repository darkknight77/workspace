package org.element.controller;

import javax.transaction.Transactional;

import org.element.configuration.BeanConfig;
import org.element.dao.StudentDao;
import org.element.model.StudentModel;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentController {
  
@Autowired	
 private StudentDao studentdao;
	
	@GetMapping("/welcome")
	@Transactional
	public ModelAndView data() {
		// TODO Auto-generated method stub

		StudentModel s = new StudentModel();
		s.setId(101);
		s.setSname("Ramanuja");
		s.setPercentage(65);
		s.setUniversity("JNTU");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("Welcome");
		mv.addObject("student", s);
		
		studentdao.psv();
		
		return mv;

	}

}