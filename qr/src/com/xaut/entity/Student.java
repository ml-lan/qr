package com.xaut.entity;

public class Student {
	private int sno; //` int(11) NOT NULL COMMENT 'sno±Ì æ—ß∫≈',
	private String sname; //` varchar(255) NOT NULL,
	private int ssex; //` int(1) DEFAULT NULL,
	private String sphone; //` varchar(11) DEFAULT NULL,
	private String spassword; //` varchar(255) DEFAULT NULL,
	private int classno; //` int(11) DEFAULT NULL,
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getSsex() {
		return ssex;
	}
	public void setSsex(int ssex) {
		this.ssex = ssex;
	}
	public String getSphone() {
		return sphone;
	}
	public void setSphone(String sphone) {
		this.sphone = sphone;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	public int getClassno() {
		return classno;
	}
	public void setClassno(int classno) {
		this.classno = classno;
	}
	
	
	

}
