package com.tweaks.dao;


import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tweaks.model.Player;



@Repository
public class PlayerDao {
@Autowired
private SessionFactory sessionFactory;

	
	public void addPlayer(Player player){
		/*Session session= null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(player);
			System.out.println("Player is created With Id::");
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		sessionFactory.getCurrentSession().saveOrUpdate(player);
	}
	
	public Player getPlayer(int id){
		/*Session session= null;
		Player p=null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			p=session.get(Player.class, new Integer(id));
			System.out.println("Player is "+p);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;*/
		
		return sessionFactory.getCurrentSession().get(Player.class, new Integer(id));
		
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Player> getPlayers(){
		/*Session session= null;
		List<Player> p=new ArrayList();
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			//p=session.get(Player.class, new Integer(id));
			p=session.createQuery("From CRK_PLR2").list();
					System.out.println("Players are "+p);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;*/
		
		return sessionFactory.getCurrentSession().createQuery("From CRK_PLR2").list();
	}
	
	
	public void updatePlayer(int id,Player player){
		/*Session session= null;

		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			System.out.println(player);
			session.saveOrUpdate(player);
			System.out.println("Player is updated With Id :"+player.getId());
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
*/	
		
	sessionFactory.getCurrentSession().saveOrUpdate(player);
	
	}

	
	public void deletePlayer(int id){
/*		Session session= null;
		Player player=null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			player=session.get(Player.class, new Integer(id));
			System.out.println(player);
			session.delete(player);
			System.out.println("Player is deleted With Id :"+player.getId());
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
*/	
	Player player=sessionFactory.getCurrentSession().get(Player.class, new Integer(id));
		sessionFactory.getCurrentSession().delete(player);
	}
}
