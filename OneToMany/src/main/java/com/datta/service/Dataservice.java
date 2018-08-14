package com.datta.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.datta.dao.MyRepo;
import com.datta.model.Country;
import com.datta.model.Player;

@RestController
public class Dataservice {
    @Autowired
	MyRepo repo;
	
    @PostMapping("/add")
    private void psvm() {
		// TODO Auto-generated method stub

    	Set<Player> players=new HashSet<>();

		Player	player=new Player(1, "Faf Duplessis", 144);
		Player	player1=(new Player(2, "Joe Root", 157));
		players.add(player);
		players.add(player1);
		
			Country c=new Country(101, "South Africa",players);
			System.out.println(c);
			repo.save(c);
			
    	
	}
    
    
	
	
}
