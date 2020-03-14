package com.ace.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Vw_Cource_Batch_Schedule_Registration_Student {
	@Id
	private String batchschstid;
	private String crsid, crsname, batchid, status, batchschedulestudentsstatus, regid, studentstatus, stid, stname;
	private int nosessions, sessionno;
	
	@Transient
	private String attst;	
	
	
	
	
	
	
	public Vw_Cource_Batch_Schedule_Registration_Student() {
		
	}
	public String getAttst() {
		return attst;
	}
	public void setAttst(String attst) {
		this.attst = attst;
	}
	public String getBatchschstid() {
		return batchschstid;
	}
	public void setBatchschstid(String batchschstid) {
		this.batchschstid = batchschstid;
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
	public String getBatchschedulestudentsstatus() {
		return batchschedulestudentsstatus;
	}
	public void setBatchschedulestudentsstatus(String batchschedulestudentsstatus) {
		this.batchschedulestudentsstatus = batchschedulestudentsstatus;
	}
	public String getRegid() {
		return regid;
	}
	public void setRegid(String regid) {
		this.regid = regid;
	}
	public String getStudentstatus() {
		return studentstatus;
	}
	public void setStudentstatus(String studentstatus) {
		this.studentstatus = studentstatus;
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
	public int getNosessions() {
		return nosessions;
	}
	public void setNosessions(int nosessions) {
		this.nosessions = nosessions;
	}
	public int getSessionno() {
		return sessionno;
	}
	public void setSessionno(int sessionno) {
		this.sessionno = sessionno;
	}
	
	
}
