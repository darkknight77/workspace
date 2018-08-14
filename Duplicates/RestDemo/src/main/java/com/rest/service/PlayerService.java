package com.rest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.rest.model.Player;
import com.rest.repository.PlayerRepository;


@Service
public class PlayerService {
    
	@Autowired
	PlayerRepository playerrepo;
	
	public List<Player> getPlayers()
	{
		System.out.println(playerrepo.findAll());
	 	return playerrepo.findAll();
	}
	
	

	
}
