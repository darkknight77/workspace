package com.transaction;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*hibernateDTO dto=new hibernateDTO();
		dto.Id=1;
		dto.LastName="Shaik";
		dto.FirstName="Latheef";
		dto.Salary=50000.00;*/
		
		hibernataeDAO dao=new hibernataeDAO();
		//dao.savehibernateDTO(dto);
	
	hibernateDTO dto1=dao.gethibernateDTO(1);
	System.out.println(dto1);
	}

}
