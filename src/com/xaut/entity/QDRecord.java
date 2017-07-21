package com.xaut.entity;

import java.util.Date;

public class QDRecord {
	private int qid;// ` int(11) NOT NULL AUTO_INCREMENT,
	private int studentno;// ` int(11) DEFAULT NULL,
	private Date qdate;// ` datetime DEFAULT NULL,
	private Date qtime;// ` time DEFAULT NULL,
	private Date qstarttime;// ` time DEFAULT NULL,
	
	
	
	private String qdate1;// ` datetime DEFAULT NULL,
	private String qtime1;// ` time DEFAULT NULL,
	private String qstarttime1;// ` time DEFAULT NULL,
	
	
	
	

	public String getQdate1() {
		return qdate1;
	}

	public void setQdate1(String qdate1) {
		this.qdate1 = qdate1;
	}

	public String getQtime1() {
		return qtime1;
	}

	public void setQtime1(String qtime1) {
		this.qtime1 = qtime1;
	}

	public String getQstarttime1() {
		return qstarttime1;
	}

	public void setQstarttime1(String qstarttime1) {
		this.qstarttime1 = qstarttime1;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public int getStudentno() {
		return studentno;
	}

	public void setStudentno(int studentno) {
		this.studentno = studentno;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	public Date getQtime() {
		return qtime;
	}

	public void setQtime(Date qtime) {
		this.qtime = qtime;
	}

	public Date getQstarttime() {
		return qstarttime;
	}

	public void setQstarttime(Date qstarttime) {
		this.qstarttime = qstarttime;
	}

}
