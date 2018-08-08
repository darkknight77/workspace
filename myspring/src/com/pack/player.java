package com.pack;

public class player {
	
	private String playerName;
	private String country;
	
	
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public void printdata()
	{
		System.out.println("Player :"+playerName);
		System.out.println("Player :"+country);
	}
	

}
