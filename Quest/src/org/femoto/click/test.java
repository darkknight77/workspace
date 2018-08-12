package org.femoto.click;

import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		QuestService service = new QuestService();
		//System.out.println(service.getallquestions());
		// System.out.println(service.getquestion(3));

		for (Question q : service.getallquestions()) {
			System.out.println(q);
		}
		System.out.println();
		service.addquestion("what is this?", " Fuck ", Arrays.asList("Fuck", "hai", "bye"));
		/*
		 * service.addquestion("godo?"," Fuck ",
		 * Arrays.asList("Fuck","hai","bye")); service.addquestion("fork",
		 * " Fuck ", Arrays.asList("Fuck","hai","bye"));
		 */
		for (Question q : service.getallquestions()) {
			System.out.println(q);
		}
		System.out.println();
		//System.out.println(service.getallquestions());
		 service.deletequestion(2);
		 //System.out.println(service.getallquestions());
		 for (Question q : service.getallquestions()) {
				System.out.println(q);
			}
		 System.out.println();
		service.updatequestion(2, "Gerrr", "derr", Arrays.asList("yuck", "trekk", "dir"));
		//Collections.sort(service.getallquestions());
		//System.out.println(service.getallquestions());
		for (Question q : service.getallquestions()) {
			System.out.println(q);
		}
	}

}
