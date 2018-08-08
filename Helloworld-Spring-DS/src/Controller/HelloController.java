package Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	@RequestMapping(value = "/hello", method = RequestMethod.GET)

	public ModelAndView display(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		
		String name= request.getParameter("name");
		
		Map m= new HashMap<>();
		m.put("msg", "Hello "+name);
		ModelAndView mv=new ModelAndView("Success",m);
		
		
		return mv;
		
		
	}

}
