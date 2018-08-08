package db.tester;

import com.dbcon.dao.dao;
import com.dbcon.db.dbconnect;

public class Tester {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		dbconnect dbcon=new dbconnect();
		dbcon.setId(1);
		dbcon.setName("Ram");
		dbcon.setAge(24);
		dbcon.setStream("ECE");
	
		dao d=new dao();
	//d.dtosave(dbcon);
		dbcon =d.getdto(1);
		System.out.println(dbcon);
	}

}
