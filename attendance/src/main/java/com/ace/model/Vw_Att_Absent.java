package com.ace.model;

public class Vw_Att_Absent {
	private String stid, crsid, stname, regid, crsname, batchid;
	private int nosessions, absents;
	public Vw_Att_Absent() {		
	}
	public Vw_Att_Absent(String stid, String crsid, String stname, String regid, String crsname, String batchid, int nos, int abs) {
		this.stid=stid;
		this.crsid=crsid;
		this.stname=stname;
		this.regid=regid;
		this.crsname=crsname;
		this.batchid=batchid;
		this.nosessions=nos;
		this.absents=abs;		
	}
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	public String getCrsid() {
		return crsid;
	}
	public void setCrsid(String crsid) {
		this.crsid = crsid;
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
	public int getNosessions() {
		return nosessions;
	}
	public void setNosessions(int nosessions) {
		this.nosessions = nosessions;
	}
	public int getAbsents() {
		return absents;
	}
	public void setAbsents(int absents) {
		this.absents = absents;
	}
	
}
