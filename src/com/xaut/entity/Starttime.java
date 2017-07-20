package com.xaut.entity;

public class Starttime {
	private int sid; //` int(11) NOT NULL,
	private String stime; // time DEFAULT NULL,
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
}
