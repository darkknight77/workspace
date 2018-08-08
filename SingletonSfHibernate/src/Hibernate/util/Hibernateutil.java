package Hibernate.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Hibernateutil {
	
	public final static SessionFactory factory;
	
	static
	{
		Configuration cfg= new Configuration();
		cfg.configure();
		factory=cfg.buildSessionFactory();
		
	}
public static SessionFactory getSessionFactory()
{
return factory;	
}
	
	
}
