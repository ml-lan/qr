package com.oracle.entity;

import java.util.Date;

public class QDRecord {
	private int qid;// ` int(11) NOT NULL AUTO_INCREMENT,
	private int studentno;// ` int(11) DEFAULT NULL,
	private Date qdate;// ` datetime DEFAULT NULL,
	private Date qtime;// ` time DEFAULT NULL,
	private Date qstarttime;// ` time DEFAULT NULL,

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
