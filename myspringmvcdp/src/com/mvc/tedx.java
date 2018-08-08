package com.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class tedx {

	@RequestMapping(value="/do")
	public ModelAndView talk(ModelAndView model)
	{
		//model.addObject("mess", "Doveeeeee");
	
		 //model=new ModelAndView("imjsp");
		 model.addObject("mess", "Drag");
		 model.setViewName("imjsp");
		return model;
		
	}
	
	@RequestMapping(value="/go")
	public ModelAndView walk()
	{
		//req.setAttribute("mess", "Doveeeeee");
		//model.addObject("mess", "Doveeeeee");
	
		ModelAndView model=new ModelAndView("imjsp");
		model.addObject("mess", "Doveeeeee");
		return model;
		
	}
	
	@RequestMapping(value="/ru")
	public String  run(ModelMap model)
	{
		//req.setAttribute("mess", "Doveeeeee");
		//model.addObject("mess", "Doveeeeee");
	   model.addAttribute("mess", "run");
		//model=new ModelAndView("imjsp");
		//model.addObject("mess", "Doveeeeee");
		return "imjsp";
		
	}
	
	
}
