package com.programs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class hashmap {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		HashMap<Integer,String> hm=new HashMap();
		hm.put(1, "hello");
		hm.put(2, "hai");
		hm.put(3, "bye");
		
		/*System.out.println(hm);
		System.out.println(hm.get(1));
*/		
		Set<Integer> s=hm.keySet();
		for (Integer integer : s) {
			System.out.println("The value of "+integer+" "+hm.get(integer));
			
		}
		
		
		
	}

}
