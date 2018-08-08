package PracticalProjects;

public class Employees {

	
	private int Id;
	private String Name;
	private String Address;
    private String MobileNumber;
    private String Email;
    private double Salary;
    
    public Employees(int id, String name, String address, String mobileNumber, String email, double salary) {
    	
		Id = id;
		Name = name;
		Address = address;
		MobileNumber = mobileNumber;
		Email = email;
		Salary = salary;
	}
    
    
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getMobileNumber() {
		return MobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		MobileNumber = mobileNumber;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public double getSalary() {
		return Salary;
	}
	public void setSalary(double salary) {
		Salary = salary;
	}
}
