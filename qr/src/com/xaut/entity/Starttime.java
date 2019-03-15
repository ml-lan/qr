package com.xaut.entity;

public class Starttime {
	private int sid; //` int(11) NOT NULL,
	private String stime; // time DEFAULT NULL,
	private int iswork;
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
	public int getIswork(){
		return iswork;
	}
	public void setIswork(int iswork){
		this.iswork = iswork;
	}
}
