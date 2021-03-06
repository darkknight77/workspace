package org.femoto.click;

import java.util.List;

public class Question implements java.lang.Comparable<Question> {

	private int id;
	private String Description;
	private String correctAnswer;
	private List<String> options;
	
	
	
	
	public Question( int count, String description, String correctAnswer, List<String> options) {
		
		this.id=count;
		this.Description = description;
		this.correctAnswer = correctAnswer;
		this.options = options;
	}
	
	public Question() {
		// TODO Auto-generated constructor stub
	}

	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getCorrectAnswer() {
		return correctAnswer;
	}
	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", Description=" + Description + ", correctAnswer=" + correctAnswer + ", options="
				+ options + "]";
	}

	@Override
	public int compareTo(Question q) {
		// TODO Auto-generated method stub
		if(this.id>q.id)
		return 1;
		else
		{
		return -1;
		}
	     
	}
	
	
}
