package generics;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		player p=new player();
		car c= new car();
		car c1= new car();
	List<car> cl=new ArrayList<>();
		p.setPlayerName("Raina");
		p.setCountry("India");
		p.setHighScore("116");
		c.setCarModel("Audi");
		c.setModelYear(1999);
		
		c.setCarModel("Toyota");
		c.setModelYear(1998);
		
		
		cl.add(c);
		cl.add(c1);
		
		
		HashMap<player,List<car>> hm=new HashMap<>();
		hm.put(p, cl);
		
		//System.out.println(hm);
		
		
 		Set<player> s=hm.keySet();
		for (player player : s) {
			
			System.out.println(player+ "and "+hm.get(player));
		}
		
	}

}
