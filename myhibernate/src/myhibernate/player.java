package myhibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="PLR_TBL")
public class player implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    int id;
	@Column(name="Player_name")
	String playerName;
	@Column(name="Country")
	String country;
	@Column(name="High_score")
	int highScore;

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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getHighScore() {
		return highScore;
	}

	public void setHighScore(int highScore) {
		this.highScore = highScore;
	}

	@Override
	public String toString() {
		return String.format("player [id=%s, playerName=%s, country=%s, highScore=%s]", id, playerName, country,
				highScore);
	}
	
	
	
}
