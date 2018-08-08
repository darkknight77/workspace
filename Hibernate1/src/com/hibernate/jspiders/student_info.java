package com.hibernate.jspiders;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
public class student_info {
	
	@Id
	private int Roll;
	
	private String Sname;
	private String PhoneNumber;
	
	
	public int getId() {
		return Roll;
	}
	public void setId(int id) {
		Roll = id;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	

}
