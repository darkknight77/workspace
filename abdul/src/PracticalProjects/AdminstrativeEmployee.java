package PracticalProjects;

public class AdminstrativeEmployee extends Employees{

	private String position;
	public AdminstrativeEmployee(int id, String name, String address, String mobileNumber, String email,
			double salary,String position) {
		super(id, name, address, mobileNumber, email, salary);
		// TODO Auto-generated constructor stub
	    this.position=position;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	

	
	
	

}
