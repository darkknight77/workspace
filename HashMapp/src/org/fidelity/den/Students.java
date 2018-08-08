package org.fidelity.den;

public class Students {
    int studentId;
	String studentName;
	String studentPhone;
	School school;
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentPhone() {
		return studentPhone;
	}
	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	@Override
	public String toString() {
		return String.format("Students [studentId=%s, studentName=%s, studentPhone=%s, school=%s]", studentId,
				studentName, studentPhone, school);
	}
	
	
}
