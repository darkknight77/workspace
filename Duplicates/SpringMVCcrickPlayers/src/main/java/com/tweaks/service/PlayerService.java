package com.tweaks.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tweaks.model.Player;



@Service
public class PlayerService {
	@Autowired
	private SessionFactory sessionFactory;

	public List<Player> getdata() {
		// TODO Auto-generated method stub

		return sessionFactory.getCurrentSession().createQuery("From CRK_PLR2").list();
	}
	
}
