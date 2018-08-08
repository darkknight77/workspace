package com.in28minutes.springboot.web.controller;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;



@Controller

public class LogoutController {
	
	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	private String logout(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		// System.out.println("Name :"+name);
		
	Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		  if(auth!=null)
		  {
			  new SecurityContextLogoutHandler().logout(request, response, auth);
		  }
	
	return "redirect:/";
	}
	
	
	public String getLoggedinUserName()
	{
		
		Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	if(principal instanceof UserDetails)
	{
		return((UserDetails)principal).getUsername();
	}
	return principal.toString();
	}
	

	
}
