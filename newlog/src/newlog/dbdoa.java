package newlog;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;

public class dbdoa {

public boolean verifyuser(String uname,String pass) throws Exception{
	
	String url="jdbc:mysql://204.11.58.151:3306/apkdopwf_apkdb";
	
	String username="apkdopwf_root";
	String password="rootroot";		
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(url,username,password);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from student");

while(rs.next()){
	
	String un=rs.getString(1);
	String ps=rs.getString(2);
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
	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
	

}
}