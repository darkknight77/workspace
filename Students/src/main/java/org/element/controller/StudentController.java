package org.element.controller;

import javax.transaction.Transactional;

import org.element.configuration.BeanConfig;
import org.element.dao.StudentDao;
import org.element.model.StudentModel;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentController {

	@Autowired
	private StudentDao studentdao;

	@GetMapping("/welcome")
	public ModelAndView data() {
		// TODO Auto-generated method stub

		ModelAndView mv = new ModelAndView();
		mv.setViewName("Welcome");

		return mv;

	}
	
	@GetMapping("/addStudent")
	public ModelAndView addStudent()
	{
		ModelAndView mv= new ModelAndView();
		mv.setViewName("addStudent");
		return mv;
		
	}
	

}
