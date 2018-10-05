package org.element.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentController {

	@GetMapping("/welcome")
	public ModelAndView data() {
		// TODO Auto-generated method stub
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Welcome");
		return mv;

	}

}
