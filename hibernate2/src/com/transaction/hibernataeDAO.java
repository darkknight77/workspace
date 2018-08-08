package com.transaction;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class hibernataeDAO {
	Configuration cfg=new Configuration().configure();
	SessionFactory sf= cfg.buildSessionFactory();
	Session s;
	public void savehibernateDTO(hibernateDTO dto)
	{
		
		try {
		        s=sf.openSession();
			Transaction tx=s.beginTransaction();
			s.save(dto);
			tx.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			s.close();
			sf.close();
			
		}
		
	}
	

	
	public hibernateDTO gethibernateDTO(int primarykey)
	{
		hibernateDTO dto=null;
		try
		{
		s=sf.openSession();
		dto=s.get(hibernateDTO.class, new Integer(primarykey));
		
			
			
		}catch(HibernateException e)
		{
		e.printStackTrace();	
		}
		finally
		{
			s.close();
			sf.close();
			
		}
		
		
		return dto;
	}
	
}
