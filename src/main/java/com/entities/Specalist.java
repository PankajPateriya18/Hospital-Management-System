package com.entities;


public class Specalist {

	private int id;
	private String specalistName;
	
	
	public Specalist(int id, String specalistName) {
		super();
		this.id = id;
		this.specalistName = specalistName;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getSpecalistName() {
		return specalistName;
	}


	public void setSpecalistName(String specalistName) {
		this.specalistName = specalistName;
	}


	public Specalist() {
		super();
		
	}
	
	
}

