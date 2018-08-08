package com.dbcon;
import java.sql.*;

public class dbcon {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub

		String url="jdbc:mysql://localhost:3306/mydb";
		String username="root";
		String password="root";		
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,username,password);
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from student");
	rs.next();
	
	String uname = rs.getString(2);
	System.out.println(uname);
	while(rs.next()){
		
		
	}
	st.close();
	con.close();
	
	}

}
