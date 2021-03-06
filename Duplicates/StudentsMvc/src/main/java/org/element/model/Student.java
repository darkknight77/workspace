package org.element.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="STU_DATA")
@Table(name="STU_DATA")
public class Student {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
    private int id;
    @Column(name="sname")
	private String Sname;
    @Column(name="percentage")
	private int Percentage ;
    @Column(name="university")
	private String University;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public int getPercentage() {
		return Percentage;
	}
	public void setPercentage(int percentage) {
		Percentage = percentage;
	}
	public String getUniversity() {
		return University;
	}
	public void setUniversity(String university) {
		University = university;
	}
	@Override
	public String toString() {
		return "StudentModel [id=" + id + ", Sname=" + Sname + ", Percentage=" + Percentage + ", University="
				+ University + "]";
	}

	
	
	
}
