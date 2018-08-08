package com.transaction;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name="Employ")
public class hibernateDTO {
	@Id
	@Column(name="E_id")
	public int Id;
	@Column(name="Frst_Nme")
	public String FirstName;
	

	@Column(name="Lst_Nme")
	public String LastName;
	@Column(name="Sal")
	public Double Salary;

	
	public hibernateDTO() {
		// TODO Auto-generated constructor stub

	System.out.println("Dude im working");
	}
	
	
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public Double getSalary() {
		return Salary;
	}

	public void setSalary(Double salary) {
		Salary = salary;
	}
	
	
	@Override
	public String toString() {
		return "hibernateDTO [Id=" + Id + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Salary=" + Salary
				+ "]";
	}
}
