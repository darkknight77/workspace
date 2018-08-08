package PracticalProjects;

import java.util.ArrayList;
import java.util.List;

public class Organisation {

	private int Id;
    private String Name;
	private String Address;
	private List<Customers> customer=new ArrayList<>();
	
	
	public Organisation(int id, String name, String address, List<Customers> customer ) {
		super();
		Id = id;
		Name = name;
		Address = address;
		this.customer = customer;
		
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
	public List<Customers> getCustomer() {
		return customer;
	}
	public void setCustomer(List<Customers> customer) {
		this.customer = customer;
	}
	
	@Override
	public String toString() {
		return String.format("Organisation [Id=%s, Name=%s, Address=%s, customer=%s]", Id, Name, Address,
				customer);
	}
		
}
