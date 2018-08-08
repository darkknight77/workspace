package myhibernate;


import java.util.HashMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		player p= new player();
		/*p.setPlayerName("Kohli");
		p.setCountry("India");
		p.setHighScore(183);
		*/
		HashMap<Integer, player> hm=new HashMap<>();
		
		hm.put(1, p);
		
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory sf=cfg.buildSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		s.save(p);
		
		
		tx.commit();
		s.close();
		sf.close();
		
		
		/*dao d= new dao();
		System.out.println(d.getplayer(1));*/
		System.out.println(hm);
	}

}
