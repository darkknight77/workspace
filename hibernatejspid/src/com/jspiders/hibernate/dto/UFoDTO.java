package com.jspiders.hibernate.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="mytb")
public class UFoDTO implements Serializable {
    @Id
    @Column(name="Id")
	private int UfoId;
    @Column(name="sape")
	private String shape;
    @Column(name="sped")
	private double speed;
    @Column(name="color")
	private String colour;
 	
public UFoDTO()
    {
	System.out.println("UFoDTO created");
	}



public int getUfoId() {
	return UfoId;
}

public void setUfoId(int ufoId) {
	UfoId = ufoId;
}

public String getShape() {
	return shape;
}

public void setShape(String shape) {
	this.shape = shape;
}

public double getSpeed() {
	return speed;
}

public void setSpeed(double speed) {
	this.speed = speed;
}

public String getColour() {
	return colour;
}

public void setColour(String colour) {
	this.colour = colour;
}



@Override
public String toString() {
	return "UFoDTO [UfoId=" + UfoId + ", shape=" + shape + ", speed=" + speed + ", colour=" + colour + "]";
}
	

	
}
