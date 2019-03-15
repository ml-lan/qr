package com.xaut.entity;

import java.util.Date;

/**
 * 实体类的规则是 私有属性 公开方法
 * 
 * @author Administrator
 * 
 */
public class Account {
	private String sphone;// ` varchar(11) DEFAULT NULL,
	private String spass;// ` varchar(255) DEFAULT NULL,
	private Date slastlogintime;// ` datetime DEFAULT NULL

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSpass() {
		return spass;
	}

	public void setSpass(String spass) {
		this.spass = spass;
	}

	public Date getSlastlogintime() {
		return slastlogintime;
	}

	public void setSlastlogintime(Date slastlogintime) {
		this.slastlogintime = slastlogintime;
	}

}
