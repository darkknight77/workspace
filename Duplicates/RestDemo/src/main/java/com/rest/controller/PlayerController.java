package com.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
 
	/*@RequestMapping(value="/players/{id}",method=RequestMethod.GET)
	public Player getPlayer(@PathVariable("id") int id)
	{
		return repository.findById(id);
	}*/
	
	@RequestMapping(value="/players/{name}",method=RequestMethod.GET)
	public Player getPlayerbyname(@PathVariable("name") String name)
	{
		return repository.findByPlayerName(name);
	
	}
	
	@PostMapping("/addplayer")
	public void  addplayer(@RequestBody Player player)
	{
		
		repository.save(player);
	}
	
	@PutMapping("/updateplayer/{id}")
	public void  updateplayer(@PathVariable int id,@RequestBody Player player)
	{
		player.setId(id);
		repository.save(player);
	}
	
	@DeleteMapping("/delete/{id}")
	public void deletePlayer(@PathVariable ("id") int id,Player player)
	{
		player=repository.findById(id);
		repository.delete(player);
	}
}
