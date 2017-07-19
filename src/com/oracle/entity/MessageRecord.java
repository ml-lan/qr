package com.oracle.entity;

import java.util.Date;

public class MessageRecord {
	private int mid;// ` int(11) NOT NULL AUTO_INCREMENT,
	private String mcontent;// ` varchar(500) DEFAULT NULL,
	private Date mdate;// ` datetime DEFAULT NULL,
	private int mformid;// ` int(11) DEFAULT NULL,
	private int mtoid;// ` int(11) DEFAULT NULL,
	private int misread;// ` int(1) DEFAULT '1' COMMENT '1表示未读\r\n2表示已读',

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public int getMformid() {
		return mformid;
	}

	public void setMformid(int mformid) {
		this.mformid = mformid;
	}

	public int getMtoid() {
		return mtoid;
	}

	public void setMtoid(int mtoid) {
		this.mtoid = mtoid;
	}

	public int getMisread() {
		return misread;
	}

	public void setMisread(int misread) {
		this.misread = misread;
	}

}
