package beans;

import org.springframework.beans.factory.annotation.Required;

public class car {

	private String carname;
	private engine eng;
	
	
	
	public car() {
		System.out.println("car");
		// TODO Auto-generated constructor stub
	}
	
	public String getCarname() {
		return carname;
	}
   @Required
   public void setCarname(String carname) {
		this.carname = carname;
	}
	public engine getEng() {
		return eng;
	}
	@Required
	public void setEng(engine eng) {
		this.eng = eng;
	}
	
	public void printcardata() {
		System.out.println("car name= "+carname);
		System.out.println("engine= "+eng.getModelyear());

	}
	
	
}
