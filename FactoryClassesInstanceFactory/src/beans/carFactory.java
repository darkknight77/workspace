package beans;

public class carFactory  {

	
	public  String carname;
	
	public  void setCarname(String carname) {
		this.carname = carname;
	}
	
	
	public  car getInstance() throws Exception
	{
		car c=(car)Class.forName(carname).newInstance();
		return c;
	}
	
	
	
	
}
