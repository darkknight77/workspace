package generics;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class hash {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		player p=new player();
		player p1=new player();
		player p2=new player();
		player p3=new player();
		
		car c= new car();
		car c1= new car();
		car c2= new car();
		car c3= new car();
		
		p.setPlayerName("Rohit");
		p.setCountry("India");
		p.setHighScore("116");
		
		p1.setPlayerName("Dhawan");
		p1.setCountry("India");
		p1.setHighScore("183");
		
		p2.setPlayerName("Bhuvi");
		p2.setCountry("India");
		p2.setHighScore("120");
		
		p3.setPlayerName("Kuldeep");
		p3.setCountry("India");
		p3.setHighScore("40");
		
		c.setCarModel("Audi");
		c.setModelYear(1999);
		
		c1.setCarModel("Toyota");
		c1.setModelYear(1998);
		
		c2.setCarModel("Benz");
		c2.setModelYear(2000);

		c3.setCarModel("Maruti");
		c3.setModelYear(2012);
		
		
		
		HashMap<player,car> hm=new HashMap<>();
		HashMap<player,car> hm1=new HashMap<>();
		HashMap<player,car> hm2=new HashMap<>();
		HashMap<player,car> hm3=new HashMap<>();
		
		hm.put(p, c);
		hm1.put(p1, c1);
		
		hm2.put(p2, c2);
		hm3.put(p3, c3);
		
		//System.out.println(hm);
		
/*
 		Set<player> s=hm.keySet();
		for (player player : s) {
			
			System.out.println(player+ "and "+hm.get(player));
		}
		
*/		
		
		
		
		
		
		
		person per=new person();
		per.setId(101);
		
		
		
		HashMap<Integer, HashMap<player,car>> hp= new HashMap<>();
		HashMap<Integer, HashMap<player,car>> hp1= new HashMap<>();
		
		hp.put(1, hm);
		hp.put(2, hm1);
		
		hp1.put(3, hm2);
		hp1.put(4, hm3);
		
		
		System.out.println(hp);
		
		System.out.println(hp.get(2).get(p1));
		System.out.println(hp1.get(4).get(p3));
		
		
		
		
		
		
		
		HashMap<String,HashMap<Integer,HashMap<player,car>>> hhm=new HashMap<>();
		
		
		hhm.put("openers", hp);
		hhm.put("bowlers", hp1);
		System.out.println(hhm);
		
		System.out.println(hhm.get("openers").get(2));
		
		System.out.println(hhm.get("bowlers").get(4));
		
		System.out.println(hhm.get("bowlers").get(4).get(p3));
	}

}
