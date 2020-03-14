package com.ace.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Vw_Studnet_Att {
	@Id
	private String attid;
	private String stid, stname, regid, crsid, attstatus, batchid;
	private int sessionno;
	public Vw_Studnet_Att() {
		// TODO Auto-generated constructor stub
	}
	public String getAttid() {
		return attid;
	}
	public void setAttid(String attid) {
		this.attid = attid;
	}
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
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
	public String getAttstatus() {
		return attstatus;
	}
	public void setAttstatus(String attstatus) {
		this.attstatus = attstatus;
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
	
	
}
