package latheef;

public class Player {

	String Name;
	String Nation;
	String Position;
	int run;
	int skills;
	int shoot;
	int pass;
	int dribble;
	int header;
	
	public int getRun() {
		return run;
	}
	public void setRun(int run) {
		this.run = run;
	}
	public int getSkills() {
		return skills;
	}
	public void setSkills(int skills) {
		this.skills = skills;
	}
	public int getShoot() {
		return shoot;
	}
	public void setShoot(int shoot) {
		this.shoot = shoot;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	public int getDribble() {
		return dribble;
	}
	public void setDribble(int dribble) {
		this.dribble = dribble;
	}
	public int getHeader() {
		return header;
	}
	public void setHeader(int header) {
		this.header = header;
	}

	
	
	
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getNation() {
		return Nation;
	}
	public void setNation(String nation) {
		Nation = nation;
	}
	public String getPosition() {
		return Position;
	}
	public void setPosition(String position) {
		Position = position;
	}
	
	
	public static void  main(String args[])
	{
		
		Player p1= new Player();
		Player p2= new Player();
		
		p1.setName("Cristiano Ronaldo");
		p1.setNation("Portugal");
		p1.setPosition("CF");
	    p1.run=95;
	    p1.skills=99;
	    p1.shoot=88;
	    p1.pass=89;
	    p1.dribble=98;
	    p1.header=999;
	    
		p2.setName("Lionel Messi");
		p2.setNation("Argentina");
		p2.setPosition("AMF");
	    p2.run=95;
	    p2.skills=88;
	    p2.shoot=94;
	    p2.pass=99;
	    p2.dribble=98;
	    p2.header=99;
	    
	
	    System.out.println(p1);
	    System.out.println(p2);
	    
	}
	
	@Override
	public String toString() {
		return "Player [Name=" + Name + ", Nation=" + Nation + ", Position=" + Position + ", run=" + run + ", skills="
				+ skills + ", shoot=" + shoot + ", pass=" + pass + ", dribble=" + dribble + ", header=" + header + "]";
	}
}
