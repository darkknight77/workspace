package myhibernate;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class dao {

	public player getplayer(int primarykey)
	{
		player p=null;
		
		try {
			Configuration cfg=new Configuration();
			cfg.configure();
			SessionFactory sf=cfg.buildSessionFactory();
			Session s=sf.openSession();
			p=s.get(player.class,new Integer(primarykey) );
			
		} catch (Exception e) {
			
			
			// TODO: handle exception
		}
		
		
		return p;
	}
	
	
}
