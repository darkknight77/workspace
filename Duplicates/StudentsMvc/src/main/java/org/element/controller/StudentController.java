package org.element.controller;

import java.util.List;

import javax.validation.Valid;

import org.element.dao.StudentDao;
import org.element.model.Student;
import org.element.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentController {

	
	@Autowired
	private StudentService service;

	@GetMapping("/list-students")
	public ModelAndView data() {
		// TODO Auto-generated method stub

		ModelAndView mv = new ModelAndView();
		List<Student> students=service.getstudents();
		mv.addObject("students",students);
		mv.setViewName("Homepage");

		return mv;

	}
	
	@GetMapping("/add-student")
	public ModelAndView showaddStudent()
	{
		ModelAndView mv= new ModelAndView();
		Student s= new Student();
		mv.addObject("student",s);
		mv.setViewName("addStudent");
		return mv;
		
	}

	@PostMapping("/add-student")
	public String addstudent(ModelMap model,@Valid Student student,BindingResult result)
	{
		if(result.hasErrors())
		{
			return "redirect:addplayer";
		}
		
		service.addstudent(student);
		
		
		return "redirect:/list-students";
		
	}
	
	@GetMapping("/update-student")
	public String showupdatestudent(ModelMap model,@RequestParam int id)
	{
		
		List<Student> students=service.getstudents();
		
		for(Student student:students)
		{
			if(id==student.getId())
			{
			  model.put("student", student);	
			  return "updateStudent";
			}
		}
		return "";
		
	}
	
	@PostMapping("/update-student")
	public String updatestudent(ModelMap model,@Valid Student student,BindingResult result)
	{
		if(result.hasErrors())
		{
			return "redirect:/addplayer";
		}
		
		service.updatestudent(student);
		
		
		return "redirect:/list-students";
		
		
	}

	@GetMapping("/delete-student")
	public String deletestudent(@RequestParam int id)
	{

		service.deletestudent(id);
		
		return "redirect:/list-students";
		
	}
	
	
}
