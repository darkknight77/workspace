package beans;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.Vector;

public class car {
	
	
	private Vector carcolors;
	private TreeSet carspeeds;
	private Hashtable carrelease;
	
	public Vector getCarcolors() {
		return carcolors;
	}






	public void setCarcolors(Vector carcolors) {
		this.carcolors = carcolors;
	}






	public TreeSet getCarspeeds() {
		return carspeeds;
	}






	public void setCarspeeds(TreeSet carspeeds) {
		this.carspeeds = carspeeds;
	}






	public Hashtable getCarrelease() {
		return carrelease;
	}






	public void setCarrelease(Hashtable carrelease) {
		this.carrelease = carrelease;
	}






	
	
	

	
	
	public void printcardata() {
		// TODO Auto-generated method stub

		
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
		
		
		System.out.println("Car Release.............");
		Set keys=carrelease.keySet();
		for(Object key:keys)
		{
			System.out.println(key+" "+carrelease.get(key)); 
		}
	}
}
