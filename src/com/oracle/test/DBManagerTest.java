package com.oracle.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

/**
 * db叫做 database 也就是数据库访问管理对象 这个类主要用于和数据库进行交互【CRUD】【增删改查】 程序的灵魂就是 数据 数据的操作就是增删改查
 * 
 * @author Administrator
 * 
 */
public class DBManagerTest {

	// 首先大家要明确 java 链接数据库的技术叫做 JDBC
	// JDBC链接数据库有五个大的步骤
	// a 加载驱动
	// b 创建链接
	// c 创建执行对象
	// d 进行CRUD的操作
	// e 释放资源 关闭链接

	// main方法是java程序的入口，java程序从此处开始执行
	public static void main(String[] args) {
		// System.out.println("hello world！");
		// JOptionPane.showMessageDialog(null, "你好，中国。世界，你好");
		// 在链接数据库的时候sun公司有一套jdbc的api，都是接口
		// 接口只能够通过实现类来运行
		// 各个数据库厂商实现了sun公司的这套接口
		// 最后将实现接口的类 组织成了一个文件就叫做jar文件。
		// 所以我们程序在访问数据库之前，首先需要导入这个实现的驱动jar文件
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://47.90.16.158:3309/erweidb", "erweidb", "ligongda");
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from account");
			while (rs.next()) {
				System.out.println(rs.getString("sphone"));
				System.out.println(rs.getString("spass"));
				System.out.println(rs.getString("slastlogintime"));
			}
			rs.close();
			st.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
