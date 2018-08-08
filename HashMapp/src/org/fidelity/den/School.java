package org.fidelity.den;

public class School {
	
	String schoolName;
	int classOf;
	String section;
	int studentId;
	
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public int getClassOf() {
		return classOf;
	}
	public void setClassOf(int classOf) {
		this.classOf = classOf;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	@Override
	public String toString() {
		return String.format("School [schoolName=%s, classOf=%s, section=%s, studentId=%s]", schoolName, classOf,
				section, studentId);
	}
	
	

}
