package com.tweaks.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



import com.tweaks.model.Player;
import com.tweaks.service.PlayerService;



@Controller
public class PlayerController {

	@Autowired
	PlayerService playerService;
	
	
	
    @RequestMapping(value = "/list-players", method = RequestMethod.GET)
	public String getplayers(ModelMap map)
	{
    	List<Player> players=new ArrayList();
		//Player player=playerService.getPlayer(1);
		 players=playerService.getPlayers();
		 System.out.println("players are :"+players);
		//map.addAttribute("player",player);
		map.put("players", players);
		return "NewFile";
	}
    
    @GetMapping("/add-player")
    public String showaddplayer(ModelMap model)
    {
    	model.put("player", new Player("", 1, 2,3,4,5));
    	
    	return "addPlayer";
    }
    @PostMapping("/add-player")
    public String addplayer(ModelMap model,@Valid Player player,BindingResult result)
    {
    	if(result.hasErrors())
    	{
    		return "/add-player";
    	}
    	
    	playerService.addPlayer(player);
    	
    	return "redirect:/list-players";
    }
    
    @GetMapping("/update-player")
    public String showupdateplayer(ModelMap model,@RequestParam int id)
    {
    	model.put("id", id);
    	Player player=playerService.getPlayer(id);
    	model.put("player", player);
    	return "updatePlayer";
    }
   
    
    @PostMapping("/update-player")
    public String updateplayer(@RequestParam int id,@Valid Player player,BindingResult result)
    {
    	if(result.hasErrors())
    	{
    		return  "updatePlayer";
    	}
     System.out.println("im in post update"+id);
      System.out.println("modified "+player); 
    	playerService.updatePlayer(id,player);
    	
    	return "redirect:/list-players";
    }
    
		
    @GetMapping("/delete-player")
    public String deleteplayer(@RequestParam int id)
    {
     System.out.println(id);
    	playerService.deletePlayer(id);
    	
    	return "redirect:/list-players";
    }
    
}


