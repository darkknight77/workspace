package org.fidelity.den;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class Doa {

	public static final String  DATABASE_DRIVER="com.mysql.jdbc.Driver";
	public static final String  DATABASE_URL="jdbc:mysql://localhost:3306/hashmap";
	public static final String  DATABASE_USERNAME="root";
	public static final String  DATABASE_Password="rootroot";
	
	public static Connection getconn()
	{
		Connection con=null;
		try {
			Class.forName(DATABASE_DRIVER);
			con = (Connection) DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_Password);
			System.out.println("Db connected Successfully");
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Db connection Failed");
			
			e.printStackTrace();
		}
		
		return con;
	}	
	
}
