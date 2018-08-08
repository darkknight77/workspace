package com.dbcon.db;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class dbconnect implements Serializable{
    @Id
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String sname;
	private int age;
	private String stream;
	
	public dbconnect() {
		System.out.println(this.getClass().getSimpleName()+" created");
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return sname;
	}

	public void setName(String name) {
		this.sname = name;
	}

	@Override
	public String toString() {
		return "dbconnect [id=" + id + ", sname=" + sname + ", age=" + age + ", stream=" + stream + "]";
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getStream() {
		return stream;
	}

	public void setStream(String stream) {
		this.stream = stream;
	}

	
	
}
