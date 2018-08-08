package generics;

public class player {

	String playerName;
	String country;
	String highScore;
	
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
	public String getHighScore() {
		return highScore;
	}
	public void setHighScore(String highScore) {
		this.highScore = highScore;
	}
	@Override
	public String toString() {
		return String.format("player [playerName=%s, country=%s, highScore=%s]", playerName, country, highScore);
	}
	
	
}
