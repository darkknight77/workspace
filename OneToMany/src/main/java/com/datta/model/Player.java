package com.datta.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name="player")
@Table(name="player")
public class Player {
    @Id
    @GeneratedValue
	int playerid;
	String playername;
	int highscore;
	
	
	
	public Player() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Player( String playerName, int highSCore ) {
		super();
		
		this.playername = playerName;
		this.highscore = highSCore;
		
	}
	public int getPlayerId() {
		return playerid;
	}
	public void setPlayerId(int playerId) {
		this.playerid = playerId;
	}
	public String getPlayerName() {
		return playername;
	}
	public void setPlayerName(String playerName) {
		this.playername = playerName;
	}
	public int getHighSCore() {
		return highscore;
	}
	public void setHighSCore(int highSCore) {
		this.highscore = highSCore;
	}
	@Override
	public String toString() {
		return "Player [playerid=" + playerid + ", playername=" + playername + ", highscore=" + highscore + "]";
	}
	}
