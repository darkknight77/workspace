package com.jspiders.hibernate.dto;

public class Tester {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UFoDTO dto=new UFoDTO();
		dto.setUfoId(102);
		dto.setColour("violet");
		dto.setShape("circle");
		dto.setSpeed(500);
		
		UFoDAO dao=new UFoDAO();
	  dao.saveUFo(dto);
		
		UFoDTO dtoo=dao.getUfodto(102);
	 System.out.println( dtoo);  
	 
	}

}
