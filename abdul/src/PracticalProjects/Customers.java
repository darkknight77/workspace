package PracticalProjects;

import java.util.ArrayList;
import java.util.List;

public class Customers {

	private int Id;
	private String Name;
	private String Address;
    private String MobileNumber;
    private String Email;
    private Services service;
    private NormEmployee employee;
    
    
    public Customers(int id, String name, String address, String mobileNumber, String email, Services service,
			NormEmployee employee) {
		super();
		Id = id;
		Name = name;
		Address = address;
		MobileNumber = mobileNumber;
		Email = email;
		this.service = service;
		this.employee = employee;
	}
    
   
	public Services getService() {
		return service;
	}
	public void setService(Services service) {
		this.service = service;
	}
	public NormEmployee getEmployee() {
		return employee;
	}
	public void setEmployee(NormEmployee employee) {
		this.employee = employee;
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
	
    
	 @Override
		public String toString() {
			return String.format(
					"Customers [Id=%s, Name=%s, Address=%s, MobileNumber=%s, Email=%s, service=%s, employee=%s]", Id, Name,
					Address, MobileNumber, Email, service, employee);
		}
}
