package com.ace.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Vw_Course_Batch {
	@Id
	private String batchid;
	private String status, crsid, crsname;
	private int nosessions;
	public Vw_Course_Batch() {
		// TODO Auto-generated constructor stub
	}
	public String getBatchid() {
		return batchid;
	}
	public void setBatchid(String batchid) {
		this.batchid = batchid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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

