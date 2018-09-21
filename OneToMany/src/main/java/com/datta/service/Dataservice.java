package com.datta.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.datta.dao.MyRepo;
import com.datta.model.Country;
import com.datta.model.Player;

@RestController
public class Dataservice {
    @Autowired
	MyRepo repo;
	
    @GetMapping("/get")
    public List<Country> get(){
    	
    	return repo.findAll();
    }
    
    @PostMapping("/add")
    private void psvm() {
		// TODO Auto-generated method stub

    	Set<Player> players=new HashSet<>();

		Player	player=new Player("Faf Duplessis", 144);
		Player	player1=(new Player("Joe Root", 157));
		players.add(player);
		players.add(player1);
		
			Country c=new Country("South Africa",players);
			System.out.println(c);
			repo.save(c);
			Set<Player> players1=new HashSet<>();
			Player	player2=new Player("Kohli", 183);
			Player	player3=(new Player("Dhawan", 120));
			players1.add(player2);
			players1.add(player3);
			
				Country c1=new Country("India",players1);
				System.out.println(c1);
			
			
			repo.save(c1);
			
    	
	}
    @GetMapping("/get/{countryid}")
    private Optional<Country> getdata(@PathVariable("countryid") int id)
    {
    	return repo.findById(id);
    	
    }
    
    @GetMapping("/get/{countryid}/players/{playerid}")
    private Player getdataofplayer(@PathVariable("countryid") int cid,@PathVariable("playerid") int pid)
    {
    	 Optional<Country> c=repo.findById(cid);
    	 Set<Player> players=c.get().getPlayers();
    	for (Player player : players) {
			if(player.getPlayerId()==pid){
				return player;
			}
		}
    return null;
    }
    

	

}