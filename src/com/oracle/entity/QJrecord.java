package com.oracle.entity;

import java.util.Date;

public class QJrecord {
	private int qid; // ` int(11) NOT NULL,
	private int studentno; //` int(11) DEFAULT NULL,
	private String qres; //` varchar(255) DEFAULT NULL,
	private Date qdate; //` datetime DEFAULT NULL,
	private int qisread; //` int(1) DEFAULT '1',
	private int qresult;//` int(1) DEFAULT NULL,
	
	
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
	public String getQres() {
		return qres;
	}
	public void setQres(String qres) {
		this.qres = qres;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public int getQisread() {
		return qisread;
	}
	public void setQisread(int qisread) {
		this.qisread = qisread;
	}
	public int getQresult() {
		return qresult;
	}
	public void setQresult(int qresult) {
		this.qresult = qresult;
	}
}
