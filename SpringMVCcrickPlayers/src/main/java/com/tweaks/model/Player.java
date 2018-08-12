package com.tweaks.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity(name="CRK_PLR2")
@Table(name="CRK_PLR2")
public class Player {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	@Column(name="player_name")
	String playerName;
	@Column(name="Matches")
	int totalMatches;
	@Column(name="Hundreds")
	int totalHundreds;
	@Column(name="Fifties")
	int totalFifties;
	@Column(name="high_score")
	int highScore;
	@Column(name="Total_runs")
	int totalScore;
	
	
	public Player(String playerName, int totalMatches, int totalHundreds, int totalFifties, int highScore,
			int totalScore) {
		super();
		
		this.playerName = playerName;
		this.totalMatches = totalMatches;
		this.totalHundreds = totalHundreds;
		this.totalFifties = totalFifties;
		this.highScore = highScore;
		this.totalScore = totalScore;
	}
	public Player() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public int getTotalMatches() {
		return totalMatches;
	}
	public void setTotalMatches(int totalMatches) {
		this.totalMatches = totalMatches;
	}
	public int getTotalHundreds() {
		return totalHundreds;
	}
	public void setTotalHundreds(int totalHundreds) {
		this.totalHundreds = totalHundreds;
	}
	public int getTotalFifties() {
		return totalFifties;
	}
	public void setTotalFifties(int totalFifties) {
		this.totalFifties = totalFifties;
	}
	public int getHighScore() {
		return highScore;
	}
	public void setHighScore(int highScore) {
		this.highScore = highScore;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	@Override
	public String toString() {
		return "Player [id=" + id + ", playerName=" + playerName + ", totalMatches=" + totalMatches + ", totalHundreds="
				+ totalHundreds + ", totalFifties=" + totalFifties + ", highScore=" + highScore + ", totalScore="
				+ totalScore + "]";
	}
}
