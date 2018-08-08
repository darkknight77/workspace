package beans;

import org.springframework.beans.factory.annotation.Required;

public class bus {

	
	private engine eng;
	
	
	public void printcardata() {
	
		System.out.println("engine= "+eng.getModelyear());

	}
	
	
}
