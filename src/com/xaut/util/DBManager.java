package com.xaut.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * db叫做 database 也就是数据库访问管理对象 这个类主要用于和数据库进行交互【CRUD】【增删改查】 程序的灵魂就是 数据 数据的操作就是增删改查
 * 
 * @author Administrator
 * 
 */
public class DBManager {

	private static final String DRIVERCLASS = "com.mysql.jdbc.Driver";
	//?useUnicode=true&characterEncoding=UTF-8
	//private static final String URL = "jdbc:mysql://118.89.150.221:3306/QRcode?useUnicode=true&characterEncoding=UTF-8";
	private static final String URL = "jdbc:mysql://127.0.01:3306/erwei?useUnicode=true&characterEncoding=UTF-8";
	private static final String NAME = "root";
	private static final String PASS = "root";
	
	//private static final String URL = "jdbc:mysql://47.90.16.158:3309/erweidb2";
	//private static final String NAME = "erweidb2";
	//private static final String PASS = "ligongda";
	
	//private static final String NAME = "myuser";
	//private static final String PASS = "mypassword";
	private Connection conn;

	static {
		try {
			Class.forName(DRIVERCLASS);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, NAME, PASS);
	}

	/**
	 * 完成数据的更新操作
	 */
	public void update(String sql) {

		try {
			conn = getConnection();
			conn.createStatement().executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

	}
	/**
	 * 完成数据的查询操作
	 */
	public ResultSet query(String sql) {
		try {
			conn = getConnection();
			return conn.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 此处connection不可以关闭，因为resultset的解析要求connection处于连接状态
		return null;

	}

	public void closeConn() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
