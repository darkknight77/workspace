package com.dbcon.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.dbcon.db.dbconnect;

public class dao {
	Configuration cfg= new Configuration().configure();
	SessionFactory sf=cfg.buildSessionFactory();
	Session s=sf.openSession();
	
	public void dtosave(dbconnect dbcon)
	{
		try {
			Transaction tx=s.beginTransaction();
			s.save(dbcon);
			tx.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		s.close();
		sf.close();
		
	}

	public dbconnect getdto(int primarykey)
	{
		
		dbconnect dbcon = null;
		try {
			
			dbcon=(dbconnect)s.get(dbconnect.class, new Integer(primarykey));
		
			Thread.sleep(5000);
			System.out.println(dbcon);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dbcon;
		
		
		
	}
	
}
