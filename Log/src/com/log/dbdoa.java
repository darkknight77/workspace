package com.log;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;

public class dbdoa {

public boolean verifyuser(String uname,String pass) throws Exception{
	
	String url="jdbc:mysql://localhost:3306/apkdopwf_apkdb";
	
	String username="apkdopwf";
	String password="2O9_~9%pSzP#";		
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(url,username,password);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from student");

while(rs.next()){
	
	String un=rs.getNString(1);
	String ps=rs.getNString(2);
	System.out.println(un);
	System.out.println(ps);
	if(uname.equals(un)&& pass.equals(ps)){
		
		return true;
	}
}
st.close();
con.close();


	
	return false;
}
	
		
	


}