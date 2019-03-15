package com.xaut.entity;

public class Teacherclass {
	private int tcid; //` int(11) NOT NULL AUTO_INCREMENT,
	private int teacherid; //` int(11) DEFAULT NULL,
	private int dictionaryid;// ` int(11) DEFAULT NULL,
	public int getTcid() {
		return tcid;
	}
	public void setTcid(int tcid) {
		this.tcid = tcid;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
	public int getDictionaryid() {
		return dictionaryid;
	}
	public void setDictionaryid(int dictionaryid) {
		this.dictionaryid = dictionaryid;
	}

}
