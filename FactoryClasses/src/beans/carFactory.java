package beans;

public class carFactory  {

	
	public static String carname;
	
	public static void setCarname(String carname) {
		carFactory.carname = carname;
	}
	
	
	public static car getInstance() throws Exception
	{
		car c=(car)Class.forName(carname).newInstance();
		return c;
	}
	
	
	
	
}
