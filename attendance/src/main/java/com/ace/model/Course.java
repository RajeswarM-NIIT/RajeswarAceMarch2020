package com.ace.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Course {
	@Id
	private String crsid;
	private String crsname;
	private int nosessions;
	public Course() {
		// TODO Auto-generated constructor stub
	}
	public String getCrsid() {
		return crsid;
	}
	public void setCrsid(String crsid) {
		this.crsid = crsid;
	}
	public String getCrsname() {
		return crsname;
	}
	public void setCrsname(String crsname) {
		this.crsname = crsname;
	}
	public int getNosessions() {
		return nosessions;
	}
	public void setNosessions(int nosessions) {
		this.nosessions = nosessions;
	}
	
}
