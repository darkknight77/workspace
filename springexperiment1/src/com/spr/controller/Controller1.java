package com.spr.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.spr.model.student;
import com.spr.service.studentService;

@Controller
public class Controller1 {
	
	@Autowired
	private studentService studentservice;
	
	
	
	public Controller1() {
        System.out.println("student Controller()");
    }
	
	
	
	@RequestMapping(value="/")
	public ModelAndView listStudent(ModelAndView model)throws IOException
	{
		List<student> liststudent=studentservice.getAllstudents();
		model.addObject("liststudent",liststudent);
		model.setViewName("success");
		
		return model;
	}
	
	
	
	@RequestMapping(value="/newStudent")
	public ModelAndView newstudent(ModelAndView model)
	{
		student student1=new student();
		model.addObject("student1", student1);
		model.setViewName("registration");
		return model;
		
	}
	
	
	
	
	
	@RequestMapping(value="/savestudent", method=RequestMethod.POST)
	public ModelAndView savestudent(@ModelAttribute student student1)
	{System.out.println("if hey id is "+student1.getId());
		if(student1.getId()==0)
		{
			System.out.println("if hey id is "+student1.getId()+student1.getBranch());
			studentservice.addstudent(student1);
		}
		else{
			System.out.println("else hey id is "+student1.getId());
		 studentservice.updatestudent(student1);
		}
		
		return new ModelAndView("redirect:/");
		}
	
	
	
	@RequestMapping(value="/deletestudent",method=RequestMethod.GET )
	 public ModelAndView deletestudent(HttpServletRequest request)
	 {
		int employeeId=Integer.parseInt(request.getParameter("id"));
		studentservice.deletestudent(employeeId);
		return new ModelAndView("redirect:/");
		
	 }
	
	 
	
	 
	 @RequestMapping(value="/editstudent",method=RequestMethod.GET)
	 public ModelAndView editstudent(HttpServletRequest request)
	 {
		 int employeeId=Integer.parseInt(request.getParameter("id"));
		 student student1=studentservice.getstudent(employeeId);
		 ModelAndView model=new ModelAndView("registration");
		 System.out.println(student1);
		 
		 model.addObject("student1",student1);
		 return model;
		 
		 
		 
	 }
	 
	
	
	/*@RequestMapping(value="/", method = RequestMethod.GET)
	public String formshow(ModelMap model)
	{
		student stu=new student();
		model.addAttribute("stud", stu);
		return "registration";
		
		student stu=new student();
		ModelAndView mod =new ModelAndView("registration");
		//model.addAttribute("student", stu);
		mod.addObject("student", stu);
		return mod;
		
	}
	
	
	 @RequestMapping(method = RequestMethod.POST)
	    public String processForm(@ModelAttribute(value = "stud") student stu,
	            BindingResult result) {
	        if (result.hasErrors()) {
	            return "registration";
	        } else {
	            System.out.println("User values is : " + stu);
	            return "success";
	        }
	    }
*/
}
