package org.femoto.click;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class QuestService {
	
	private static List<Question> questions;
	static int count=0;
	static{
		//""
	 
		Question q1=new Question(++count,"What is the largest country in the world?" ,"i dont know", Arrays.asList("i know but i wont tell","i dont know","whatever","why should i tell you"));
		Question q2=new Question(++count,"Who r u?" ,"shut the fuck up", Arrays.asList("i know but i wont tell","i dont know","shut the fuck up","why should i tell you"));
		Question q3=new Question(++count,"How r u ?" ,"im awesome", Arrays.asList("im awesome","How r u?","whatever","why should i tell you"));
        questions=new ArrayList<>(Arrays.asList(q1,q2,q3));
	}
	
	
	//This function returns List of Questions that are initialized from static block
	public static List<Question> getallquestions()
	{
		Collections.sort(questions);
	
		return questions;
		
	}
	
	//This function iterates through the list of questions and checks for matching id and returns the Question object if id matches 
	public static Question getquestion(int id)
	{
		for(Question q:questions)
		{
			if(q.getId()==id)
				return q;
		}
		return null;
	}
	
	public static void addquestion(String description, String correctAnswer, List<String> options)
	{
		 questions.add(new Question(++count, description, correctAnswer, options));		
		
	}

	
	public static void updatequestion(int id,String description, String correctAnswer, List<String> options)
	{
		
		deletequestion(id);
		questions.add(new Question(id, description, correctAnswer, options));		
		//questions.set(id,new Question(id, description, correctAnswer, options) );
	
	}

	public static void deletequestion(int id)
	{
		Question q=getquestion(id);
        questions.remove(q);	
	}

	
	
	

}
