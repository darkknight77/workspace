package beans;

public class car {

	
	private static String carname[];
	public static void setCarname(String carname[]) {
		car.carname = carname;
	}
	
	public static void hello()
	{
		System.out.println("Hello "+carname[0]+carname[1]);
	}
}
