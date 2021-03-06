package com.datta.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="country")
@Table(name="country")
public class Country {

	@Id
	@GeneratedValue
	int countryid;
	String countryname;
	
	public Country() {
		
		// TODO Auto-generated constructor stub
	}
	@OneToMany(cascade = {CascadeType.ALL})
	Set<Player> players=new HashSet<>();

	
	public Country( String name, Set<Player> players) {
		super();
		
		this.countryname = name;
		this.players = players;
	}
	public int getCountryId() {
		return countryid;
	}
	public void setCountryId(int countryId) {
		this.countryid = countryId;
	}
	public String getName() {
		return countryname;
	}
	public void setName(String name) {
		this.countryname = name;
	}
	public Set<Player> getPlayers() {
		return players;
	}
	public void setPlayers(Set<Player> players) {
		this.players = players;
	}
	@Override
	public String toString() {
		return "Country [countryid=" + countryid + ", countryname=" + countryname + ", players=" + players + "]";
	}
	
	
	
}
