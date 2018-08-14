package com.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.rest.model.Player;
import com.rest.repository.PlayerRepository;
import com.rest.service.PlayerService;

@RestController
public class PlayerController {
    
	
	@Autowired
	PlayerRepository repository;
	
	@RequestMapping(value="/players",method=RequestMethod.GET)
	public List<Player> getPlayers()
	{
		return repository.findAll() ;	
	}
  /*  
	@RequestMapping(value="/players/{id}",method=RequestMethod.GET)
	public Player getPlayer(@PathVariable("id") String id)
	{
		return repository.findbyplayer_name(id);
	}*/
	
	
}
