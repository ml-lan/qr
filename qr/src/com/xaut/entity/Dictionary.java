package com.xaut.entity;

public class Dictionary {
	private int did;// ` int(11) NOT NULL AUTO_INCREMENT,
	private String dxyname;// ` varchar(255) DEFAULT NULL,
	private String dxiname;// ` varchar(255) DEFAULT NULL,
	private String dzyname;// ` varchar(255) DEFAULT NULL,
	private String dnjname;// ` varchar(255) DEFAULT NULL,
	private String dbjname;// ` varchar(255) DEFAULT NULL,

	// ¿ì½Ý¼ü
	// alt+shift+s
	
	

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public String getDxyname() {
		return dxyname;
	}

	public void setDxyname(String dxyname) {
		this.dxyname = dxyname;
	}

	public String getDxiname() {
		return dxiname;
	}

	public void setDxiname(String dxiname) {
		this.dxiname = dxiname;
	}

	public String getDzyname() {
		return dzyname;
	}

	public void setDzyname(String dzyname) {
		this.dzyname = dzyname;
	}

	public String getDnjname() {
		return dnjname;
	}

	public void setDnjname(String dnjname) {
		this.dnjname = dnjname;
	}

	public String getDbjname() {
		return dbjname;
	}

	public void setDbjname(String dbjname) {
		this.dbjname = dbjname;
	}

}
