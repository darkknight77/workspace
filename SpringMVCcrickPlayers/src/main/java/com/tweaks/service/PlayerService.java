package com.tweaks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tweaks.dao.PlayerDao;
import com.tweaks.model.Player;

@Service
@Transactional
public class PlayerService {
	@Autowired
	private PlayerDao playerdao;

	public void addPlayer(Player player) {
		playerdao.addPlayer(player);
	}

	public Player getPlayer(int id) {
		return playerdao.getPlayer(id);
	}

	public List<Player> getPlayers() {
		return playerdao.getPlayers();

	}

	public void updatePlayer(int id, Player player) {

		playerdao.updatePlayer(id, player);

	}

	public void deletePlayer(int id) {

		playerdao.deletePlayer(id);
	}

}
