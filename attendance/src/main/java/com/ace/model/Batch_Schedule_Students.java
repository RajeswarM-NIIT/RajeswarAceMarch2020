package com.ace.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Batch_Schedule_Students {
	@Id
	private String batchschstid;
	private String regid, crsid, bactchid, batchschedulestudentsstatus;
	private int sessionno;
	public Batch_Schedule_Students() {
		// TODO Auto-generated constructor stub
	}
	public String getBatchschstid() {
		return batchschstid;
	}
	public void setBatchschstid(String batchschstid) {
		this.batchschstid = batchschstid;
	}
	public String getRegid() {
		return regid;
	}
	public void setRegid(String regid) {
		this.regid = regid;
	}
	public String getCrsid() {
		return crsid;
	}
	public void setCrsid(String crsid) {
		this.crsid = crsid;
	}
	public String getBactchid() {
		return bactchid;
	}
	public void setBactchid(String bactchid) {
		this.bactchid = bactchid;
	}
	public String getBatchschedulestudentsstatus() {
		return batchschedulestudentsstatus;
	}
	public void setBatchschedulestudentsstatus(String batchschedulestudentsstatus) {
		this.batchschedulestudentsstatus = batchschedulestudentsstatus;
	}
	public int getSessionno() {
		return sessionno;
	}
	public void setSessionno(int sessionno) {
		this.sessionno = sessionno;
	}
	
	
}
