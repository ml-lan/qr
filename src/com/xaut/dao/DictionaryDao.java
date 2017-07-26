package com.xaut.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xaut.entity.Dictionary;
import com.xaut.util.DBManager;

public class DictionaryDao {

	private DBManager db = new DBManager();

	/**
	 * 查询所有的字典信息 数据库中一条字典记录 对应一个java类 Dictionary 很多条记录呢 就应该是一个 集合 List 就是一个集合
	 * 
	 * @return
	 */
	public List<Dictionary> queryAll() {
		// list是一个集合的接口
		// ArrayList是实现了数组动态扩容的一个List接口的实现类
		List<Dictionary> list = new ArrayList<Dictionary>();

		String sql = "select * from dictionary order by did desc ";
		ResultSet rs = db.query(sql);

		try {
			while (rs.next()) {
				// 一条记录对应一个java类对象
				Dictionary d = new Dictionary();
				d.setDbjname(rs.getString("dbjname"));
				d.setDid(rs.getInt("did"));
				d.setDnjname(rs.getString("dnjname"));
				d.setDxiname(rs.getString("dxiname"));
				d.setDxyname(rs.getString("dxyname"));
				d.setDzyname(rs.getString("dzyname"));
				list.add(d);// 向集合中添加数据
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeConn();

		return list;

	}

	/**
	 * 根据传递的字典数据在数据库中进行查询 如果找到了，则返回true 否则返回 false
	 * 
	 * @param d
	 * @return
	 */
	public boolean queryByParam(Dictionary d) {
		try {
			String sql = "select * from dictionary where dxyname='"
					+ d.getDxyname() + "' AND" + "  dxiname ='"
					+ d.getDxiname() + "'  " + "AND dzyname='" + d.getDzyname()
					+ "'  " + "AND dnjname='" + d.getDnjname() + "' "
					+ "and  dbjname='" + d.getDbjname() + "'";

			return db.query(sql).next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn();

		return true;

	}

	/**
	 * 保存数据
	 * 
	 * @param d
	 */
	public void save(Dictionary d) {
		String sql = "insert into dictionary(dxyname,dxiname,dzyname,dnjname,dbjname)"
				+ " values('"
				+ d.getDxyname()
				+ "','"
				+ d.getDxiname()
				+ "','"
				+ d.getDzyname()
				+ "','"
				+ d.getDnjname()
				+ "','"
				+ d.getDbjname() + "')";
		db.update(sql);
	}

	
	
	/**
	 * 得到数据字典中 学院名称不重复的数据
	 * 
	 * @return
	 */
	public List<String> getYuan() {
		List<String> list = new ArrayList<String>();

		String sql = "select DISTINCT dxyname from dictionary";
		ResultSet rs = db.query(sql);

		try {
			while (rs.next()) {

				list.add(rs.getString("dxyname"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		db.closeConn();

		return list;
	}

	/**
	 * 得到数据字典中 学院名称不重复的数据
	 * 
	 * @return
	 */
	public List<String> getX() {
		List<String> list = new ArrayList<String>();

		String sql = "select DISTINCT dxiname from dictionary";
		ResultSet rs = db.query(sql);

		try {
			while (rs.next()) {

				list.add(rs.getString("dxiname"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		db.closeConn();

		return list;
	}

	public List<String> getZY() {
		List<String> list = new ArrayList<String>();

		String sql = "select DISTINCT dzyname from dictionary";
		ResultSet rs = db.query(sql);

		try {
			while (rs.next()) {

				list.add(rs.getString("dzyname"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		db.closeConn();

		return list;
	}

	public List<String> getNJ() {
		List<String> list = new ArrayList<String>();

		String sql = "select DISTINCT dnjname from dictionary";
		ResultSet rs = db.query(sql);

		try {
			while (rs.next()) {

				list.add(rs.getString("dnjname"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		db.closeConn();

		return list;
	}

	public List<String> getBJ() {
		List<String> list = new ArrayList<String>();

		String sql = "select DISTINCT  dbjname from dictionary";
		ResultSet rs = db.query(sql);

		try {
			while (rs.next()) {

				list.add(rs.getString("dbjname"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		db.closeConn();

		return list;
	}

	/**
	 * 查询全部的班级
	 * 
	 * @return
	 */
	public Map<String, Dictionary> getBJAll() {
		// map是键值对集合
		Map<String, Dictionary> map = new HashMap<String, Dictionary>();
		String sql = "select * from dictionary";
		ResultSet rs = db.query(sql);

		try {
			while (rs.next()) {
				// 一条记录对应一个java类对象
				Dictionary d = new Dictionary();
				d.setDbjname(rs.getString("dbjname"));
				d.setDnjname(rs.getString("dnjname"));
				d.setDxiname(rs.getString("dxiname"));
				d.setDxyname(rs.getString("dxyname"));
				d.setDzyname(rs.getString("dzyname"));
				map.put(rs.getInt("did") + "", d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		db.closeConn();

		return map;
	}

	public List<Object[]> getClassStuCount() {

		List<Object[]> list = new ArrayList<Object[]>();

		try {
			String sql = "SELECT	CONCAT(d.dnjname,'级',d.dbjname),	count(s.sno) FROM	student s,	dictionary d where 	s.classno=d.did group by 	d.dnjname,d.dbjname";
			ResultSet rs = db.query(sql);
			while (rs.next()) {

				Object obj[] = new Object[2];
				obj[0] = rs.getObject(1);
				obj[1] = rs.getObject(2);
				list.add(obj);

			}
		} catch (SQLException e) {
 			e.printStackTrace();
		}

		db.closeConn();

		return list;
	}

}
