package com.driller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {
	
@GetMapping("/")
public String trial() {
	// TODO Auto-generated method stub

	return "Welcome";
}	
	
}
