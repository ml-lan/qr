package com.oracle.entity;

import java.util.Date;

public class ErWei {

	private int eid;// ` int(11) NOT NULL AUTO_INCREMENT,
	private int teacherid;// ` int(11) DEFAULT NULL,
	private String ecodepass;// ` varchar(255) DEFAULT NULL,
	private Date estarttime;// ` datetime DEFAULT NULL,
	private String eserverpath;// ` varchar(255) DEFAULT NULL,
	private String eerweipath;// ` varchar(255) DEFAULT NULL,

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public int getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}

	public String getEcodepass() {
		return ecodepass;
	}

	public void setEcodepass(String ecodepass) {
		this.ecodepass = ecodepass;
	}

	public Date getEstarttime() {
		return estarttime;
	}

	public void setEstarttime(Date estarttime) {
		this.estarttime = estarttime;
	}

	public String getEserverpath() {
		return eserverpath;
	}

	public void setEserverpath(String eserverpath) {
		this.eserverpath = eserverpath;
	}

	public String getEerweipath() {
		return eerweipath;
	}

	public void setEerweipath(String eerweipath) {
		this.eerweipath = eerweipath;
	}

}
