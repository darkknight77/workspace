package beans;

public class Test {

	
	String message;
	public Test(String mess,int num) {
		System.out.println("Test Con"+mess+num);
		// TODO Auto-generated constructor stub
	}
	
	public void hello()
	{
	System.out.println("Hello Latheef "+message);	
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
