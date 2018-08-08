package com.SpringMvc.todo;
import java.util.Date;
public class Todo {

	private int id;
	public Todo(int id, String user, String desc, Date targetdate, boolean isDone) {
		super();
		this.id = id;
		this.user = user;
		this.desc = desc;
		this.targetdate = targetdate;
		this.isDone = isDone;
	}
	
	private String user;
	private String desc;
	private Date targetdate;
	private boolean isDone;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Date getTargetdate() {
		return targetdate;
	}
	public void setTargetdate(Date targetdate) {
		this.targetdate = targetdate;
	}
	public boolean isDone() {
		return isDone;
	}
	public void setDone(boolean isDone) {
		this.isDone = isDone;
	}
	@Override
	public String toString() {
		return String.format("ToString - Todo [id=%s, user=%s, desc=%s, targetdate=%s, isDone=%s]", id, user, desc, targetdate,
				isDone);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Todo other = (Todo) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}
