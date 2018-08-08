package com.intellijide.java;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class AlienDAO {

	 Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
	    SessionFactory sf = cfg.buildSessionFactory();
	    Session s;

    public void aliendtosave(AlienDTO dto) {

    	try {
            s = sf.openSession();
            Transaction tx = s.beginTransaction();
            s.save(dto);
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    	finally {
            s.close();
            sf.close();

        }


    }

    public AlienDTO alienDTO(int primarykey)
    {
        AlienDTO dto=null;

        try {
        	 s = sf.openSession();
            dto = s.get(AlienDTO.class, new Integer(primarykey));
        } catch (Exception e) {
            e.printStackTrace();
        }
    return dto;
    }

}
