package com.xaut.entity;

public class Teacher {
	private int tid; //` int(11) NOT NULL AUTO_INCREMENT,
	private String tphone;//` varchar(11) NOT NULL,
	private String tname; //` varchar(255) NOT NULL,
	private int tsex; //` int(1) NOT NULL DEFAULT '1',
	private String tpassword; //` varchar(255) NOT NULL,
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTphone() {
		return tphone;
	}
	public void setTphone(String tphone) {
		this.tphone = tphone;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getTsex() {
		return tsex;
	}
	public void setTsex(int tsex) {
		this.tsex = tsex;
	}
	public String getTpassword() {
		return tpassword;
	}
	public void setTpassword(String tpassword) {
		this.tpassword = tpassword;
	}

}
