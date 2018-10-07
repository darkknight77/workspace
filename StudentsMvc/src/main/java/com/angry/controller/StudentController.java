package com.angry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentController {

	@GetMapping("/")
	private String welcome() {
		// TODO Auto-generated method stub

		return "welcome";
		
	}
	
	
}
