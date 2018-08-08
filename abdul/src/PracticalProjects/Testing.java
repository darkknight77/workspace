package PracticalProjects;

import java.util.ArrayList;
import java.util.List;

public class Testing {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
List<Customers> customers= new ArrayList<>();
List<Services> services= new ArrayList<>();
		
		//Employees emps=new Employees(1,"Ram","Electronic City","9173678287","ram@gmail.com",5000);
		NormEmployee nemp=new NormEmployee(1,"Ram","Electronic City","9173678287","ram@gmail.com",5000,5,"Pro");
		AdminstrativeEmployee aemp=new AdminstrativeEmployee(2, "Rahul", "Marathalli", "9578474847", "rahul@gmail.com", 7000, "Senior Executive");
        
		Services srvs= new Services(444,"Prime Membership",399.00);
        Services srvs1= new Services(555,"Jio Dhana Dhan",299.00);
        
		Customers cust1=new Customers(488, "Latheef", "Tirupathi", "9030337873", "latheefshaik@gmail.com",srvs , nemp);
		Customers cust2=new Customers(489, "Srikanth", "Ameerpet", "9489794849", "srikanth@gmail.com",srvs1 , nemp);
		
		customers.add(cust1);
		customers.add(cust2);
		
		services.add(srvs);
		services.add(srvs1);
		
		Organisation org=new Organisation(101,"Jio","Gachibowli",customers);
		
		
		
	System.out.println(org);
	//System.out.println(cust2);
	
	}

}
