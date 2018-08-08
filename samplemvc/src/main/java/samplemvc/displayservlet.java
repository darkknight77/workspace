package samplemvc;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class displayservlet {

	@RequestMapping(value="/", method=RequestMethod.GET)
	
	public String m1()
	
	{
		return "Login";
	}
	
	@RequestMapping(value="/postdisplay", method=RequestMethod.POST)
	public String m2(@RequestParam String username,@RequestParam String password,ModelMap model)
	{
		
		model.put("username",username);
		model.put("pass", password);
		
		return "Welcome";
	}
	
	
}
