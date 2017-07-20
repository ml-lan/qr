package com.xaut.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xaut.entity.Teacher;
import com.xaut.util.DBManager;

public class TeacherDao {

	private DBManager db = new DBManager();

	/**
	 * 根据老师的电话号码查找老师对象 为什么登录的方法我们需要如此设计呢？ 比较直观的是大家可以通过手机号和密码同时查找一条数据！
	 * DAO层是和数据库打交道的 为了让dao层中的方法最大化的复用，所以我们要将dao的方法设置为原子方法，
	 * queryByTeacherPhone还有一个好处， 既可以查找老师信息委 查找逻辑提供dao的支持 也可以为登录逻辑提供dao支持 代码就复用了
	 * 
	 * 
	 * @param phoneNo
	 * @return
	 */
	public Teacher queryByTeacherPhone(String phoneNo) {
		Teacher t = null;
		String sql = " select * from teacher where tphone= '" + phoneNo + "' ";
		ResultSet rs = db.query(sql);
		try {
			while (rs.next()) {// 如果查到了数据
				t = new Teacher();// 构建空的teacher对象
				t.setTid(rs.getInt("tid"));
				t.setTname(rs.getString("tname"));
				t.setTpassword(rs.getString("tpassword"));
				t.setTphone(rs.getString("tphone"));
				t.setTsex(rs.getInt("tsex"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t;

	}

	/**
	 * 查询表中所有的数据
	 * @return
	 */
	public List<Teacher> queryAll() {
		List<Teacher> list = new ArrayList<Teacher>();

		String sql = " select * from teacher  ";
		ResultSet rs = db.query(sql);
		try {
			while (rs.next()) {// 如果查到了数据
				Teacher t = new Teacher();// 构建空的teacher对象
				t.setTid(rs.getInt("tid"));
				t.setTname(rs.getString("tname"));
				t.setTpassword(rs.getString("tpassword"));
				t.setTphone(rs.getString("tphone"));
				t.setTsex(rs.getInt("tsex"));
				list.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}
	
	
	public int saveTeacher(Teacher t) {
 		String sql = "insert into teacher(tphone,tname,tsex,tpassword) values('"
				+ t.getTphone()
				+ "','"
				+ t.getTname()
				+ "',"
				+ t.getTsex()
				+ ",'" + t.getTpassword() + "')";
		String sqlid = "select max(tid) mid from teacher";

		db.update(sql);
		ResultSet rs = db.query(sqlid);
		try {
			rs.next();// 下移到数据行
			return rs.getInt("mid");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn();
		return -1;

	}

	
	
}
