package com.ace.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Batch {
	@Id
	private String batchid;
	private String crsid, status;
	public Batch() {
		// TODO Auto-generated constructor stub
	}
	public String getBatchid() {
		return batchid;
	}
	public void setBatchid(String batchid) {
		this.batchid = batchid;
	}
	public String getCrsid() {
		return crsid;
	}
	public void setCrsid(String crsid) {
		this.crsid = crsid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
