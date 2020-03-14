package com.ace.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Att_Batch_Schedule_Students {
	@Id
	private String attid;
	private String batchschstid, regid, crsid, batchid,  attstatus;
	private int sessionno;
	public Att_Batch_Schedule_Students() {
		
	}
	public String getAttid() {
		return attid;
	}
	public void setAttid(String attid) {
		this.attid = attid;
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
	public String getBatchid() {
		return batchid;
	}
	public void setBatchid(String batchid) {
		this.batchid = batchid;
	}
	public int getSessionno() {
		return sessionno;
	}
	public void setSessionno(int sessionno) {
		this.sessionno = sessionno;
	}
	public String getAttstatus() {
		return attstatus;
	}
	public void setAttstatus(String attstatus) {
		this.attstatus = attstatus;
	}
	
	
}
