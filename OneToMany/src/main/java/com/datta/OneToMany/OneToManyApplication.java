package com.datta.OneToMany;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.datta.dao.MyRepo;
import com.datta.model.Country;
import com.datta.model.Player;

@SpringBootApplication
@EnableJpaRepositories("com.datta.dao")
@EntityScan("com.datta.model")
@ComponentScan("com.datta")
public class OneToManyApplication {

	@Autowired
	MyRepo repo;
	
	public static void main(String[] args) {
		SpringApplication.run(OneToManyApplication.class, args);
	}
	
	
	class Runner implements CommandLineRunner
	{

		@Override
		public void run(String... args) throws Exception {
			// TODO Auto-generated method stub
		/*	
			List<Player> players=new ArrayList<>();

		Player	player=new Player(1, "Faf Duplessis", 144);
		Player	player1=(new Player(2, "Joe Root", 157));
		players.add(player);
		players.add(player1);
		
			Country c=new Country(101, "South Africa",players);
			
			repo.save(c);*/
			
			
			
		}
		
		
		
	}
	
	
}
