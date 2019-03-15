package com.xaut.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xaut.entity.Dictionary;

import com.xaut.entity.Teacherclass;
import com.xaut.util.DBManager;
public class TeacherClassDao {
	
	private DBManager db = new DBManager();

	public void save(Teacherclass t) {

		String sql = "insert into teacherclass(teacherid,dictionaryid) values(" + t.getTeacherid()
				+ "," + t.getDictionaryid() + ")";
		db.update(sql);

	}

	/**
	 * 通过老师的编号，获取老师对应的班级信息 
	 * 
	 * @return 
	 */
	public List<Dictionary> queryByTeacherId(int teacherId) {
		List<Dictionary> list = new ArrayList<Dictionary>();
		String sql = "SELECT   d.did , d.dnjname,d.dzyname,d.dbjname from teacher t,dictionary d,teacherclass  tc where t.tid="+teacherId+" and tc.dictionaryid=d.did and tc.teacherid=t.tid";
		ResultSet rs = db.query(sql);
		try {
			while (rs.next()) {

				Dictionary d = new Dictionary();
				d.setDnjname(rs.getString("dnjname"));
				d.setDbjname(rs.getString("dbjname"));
				d.setDzyname(rs.getString("dzyname"));
				d.setDid(rs.getInt("did"));  
				list.add(d);

			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		return list;
	}
}
