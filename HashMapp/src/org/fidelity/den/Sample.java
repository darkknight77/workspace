package org.fidelity.den;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class Sample {
	
	
	public static void populateschool(HashMap<Integer, School> schoolhmap) throws SQLException
	{
		
		Connection con=Doa.getconn();
		Statement st=(Statement) con.createStatement();
		String query="Select * from school";
		ResultSet rs=st.executeQuery(query);
	
		
		while(rs.next())
		{
			
			
			School sch=new School();
			
			String schname=rs.getString(1);
			int classOf=rs.getInt(2);
			String section=rs.getString(3);
			int studentid=rs.getInt(4);
		
			sch.setSchoolName(schname);
			sch.setClassOf(classOf);
			sch.setSection(section);
			sch.setStudentId(studentid);
			schoolhmap.put(studentid, sch);
		
			
		}
		st.close();
		con.close();


	} 
	
	
	
	public static void populatestudents(HashMap<Integer, Students> studenthmap,HashMap<Integer,School> schoolhmap) throws SQLException
	{
		
		Connection con=Doa.getconn();
		Statement st=(Statement) con.createStatement();
		String query="Select * from students";
		ResultSet rs=st.executeQuery(query);
	
		
		while(rs.next())
		{
			
			Students stud= new Students(); 
			School sch=new School();
			
			int id=rs.getInt(1);
			String name=rs.getString(2);
			String phonenum=rs.getString(3);
			String school=rs.getString(4);
			//System.out.println("Id is "+id+" Name is "+name+" Phone Number is "+phonenum+" School is "+school);
			
			sch.setStudentId(id);
			sch.setSchoolName(schoolhmap.get(id).getSchoolName());
			sch.setClassOf(schoolhmap.get(id).getClassOf());
			sch.setSection(schoolhmap.get(id).getSection());
			
			stud.setStudentId(id);
			stud.setStudentName(name);
			stud.setStudentPhone(phonenum);
			stud.setSchool(sch);
			studenthmap.put(id, stud);
			
			
		}
		st.close();
		con.close();


	} 
	
	
	
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub

		HashMap<Integer,School> schoolhmap=new HashMap<>(); 
		
		HashMap<Integer,Students> studenthmap=new HashMap<>(); 
		
		
		
		populateschool(schoolhmap);
		
		populatestudents(studenthmap,schoolhmap);
		
		
	System.out.println(schoolhmap);
	System.out.println(studenthmap);
	
		
	}



	
}
