package beans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;

public class car {
    
	@Autowired
	@Qualifier(value="e2")
	private engine eng;
	
public void printcardata() {
		
		System.out.println("engine= "+eng.getModelyear());

	}
	
	
	
}
