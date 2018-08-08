package com.intellijide.java;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class AlienDTO implements Serializable {
    @Id
    private int Aid;
    private String Aname;
    private String Ajet;
    private String Laptop;

    public AlienDTO() {
        System.out.println("Alien constructor");
    }

    public int getAid() {
        return Aid;
    }

    public void setAid(int aid) {
        Aid = aid;
    }

    public String getAname() {
        return Aname;

    }

    public void setAname(String aname) {
        Aname = aname;
    }

    public String getAjet() {
        return Ajet;
    }

    public void setAjet(String ajet) {
        Ajet = ajet;
    }

    public String getLaptop() {
        return Laptop;
    }

    public void setLaptop(String laptop) {
        Laptop = laptop;
    }

    @Override
    public String toString() {
        return "AlienDTO{" +
                "Aname='" + Aname + '\'' +
                ", Ajet='" + Ajet + '\'' +
                ", Laptop='" + Laptop + '\'' +
                '}';
    }
}
