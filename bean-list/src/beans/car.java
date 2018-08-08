package beans;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class car {
	
	private String[] carnames;
	private List carcolors;
	private Set carspeeds;
	private engine[] eng;
	private Map carrelease;
	
	public Map getCarrelease() {
		return carrelease;
	}
	public void setCarrelease(Map carrelease) {
		this.carrelease = carrelease;
	}
	public String[] getCarnames() {
		return carnames;
	}
	public void setCarnames(String[] carnames) {
		this.carnames = carnames;
	}
	public List getCarcolors() {
		return carcolors;
	}
	public void setCarcolors(List carcolors) {
		this.carcolors = carcolors;
	}
	public Set getCarspeeds() {
		return carspeeds;
	}
	public void setCarspeeds(Set carspeeds) {
		this.carspeeds = carspeeds;
	}
	public engine[] getEng() {
		return eng;
	}
	public void setEng(engine[] eng) {
		this.eng = eng;
	}

	
	
	public void printcardata() {
		// TODO Auto-generated method stub

		System.out.println("CarNames.............");
		for(String name:carnames)
		{
			System.out.println(name);
		}
		
		System.out.println("Carcolors.............");
		for(Object color:carcolors)
		{
			System.out.println(color);
		}
	
		System.out.println("CarSpeeds.............");
		for(Object speed:carspeeds)
		{
			System.out.println(speed);
		}
		
		System.out.println("Model years.............");
		for(engine my:eng)
		{
			System.out.println(my.getModelyear());
		}
		
		System.out.println("Car Release.............");
		Set keys=carrelease.keySet();
		for(Object key:keys)
		{
			System.out.println(key+" "+carrelease.get(key)); 
		}
	}
}
