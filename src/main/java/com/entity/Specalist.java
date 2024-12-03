package com.entity;

public class Specalist {
	private int id;
	private String specialistName;
	//Super Constructor
	public Specalist() {
		super();
		// TODO Auto-generated constructor stub
	}
	//Parameter Constructor
	public Specalist(int id, String specialistName) {
		super();
		this.id = id;
		this.specialistName = specialistName;
	}
	//Setter and Getter Method
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSpecialistName() {
		return specialistName;
	}
	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}
	

}
