package com.oracle.test;

import com.oracle.util.DBManager;

public class TestDBManager {
	public static void main(String[] args) {

		DBManager db = new DBManager();
		db.update("update account set sphone='110'");

	}
}
