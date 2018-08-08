package com.jspiders.hibernate.dto;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UFoDAO {

	public void saveUFo(UFoDTO dto)
	{
	Configuration cfg=new Configuration();
	cfg.configure();
	SessionFactory sf=cfg.buildSessionFactory();
	Session s=sf.openSession();
	Transaction tx=s.beginTransaction();
	s.save(dto);
	tx.commit();
	s.close();
	sf.close();
	}
	
	public UFoDTO getUfodto(int primarykey){
	
		UFoDTO dto=null;
		try{
			
				Configuration cfg=new Configuration();
				cfg.configure();
				SessionFactory sf=cfg.buildSessionFactory();
				Session s=sf.openSession();
			dto=s.get(UFoDTO.class,new Integer(primarykey));	
			System.out.println( "im in getufo"+dto);
		}
		catch(HibernateException e){
			
		System.out.println("exception  ..........  ");
		}
		
		
		return dto;
		
	}
}
