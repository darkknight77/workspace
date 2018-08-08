package com.intellijide.java;

public class Datagrabber {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 AlienDTO dto=new AlienDTO();
		    dto.setAid(301);
		    dto.setAname("somu");
		    dto.setLaptop("holloo");
		    dto.setAjet("B-9 fegondor");

		    AlienDAO dao=new AlienDAO();
		    dao.aliendtosave(dto);

		    
//System.out.println(dao.alienDTO(300));
	}

}
