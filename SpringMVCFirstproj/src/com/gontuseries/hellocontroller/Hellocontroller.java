package com.gontuseries.hellocontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class Hellocontroller extends AbstractController{

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		// TODO Auto-generated method stub\\
		ModelAndView modelAndView =new ModelAndView("HelloPage");
		modelAndView.addObject("WelcomeMessage","Hi user, Welcome to the first Spring MVC Application");
		
		return modelAndView;
	}

}
