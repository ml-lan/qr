package com.oracle.dao;


import com.oracle.entity.Teacherclass;
import com.oracle.util.DBManager;

public class TeacherClassDao {
	
	private DBManager db = new DBManager();

	public void save(Teacherclass t) {

		String sql = "insert into teacherclass(teacherid,dictionaryid) values(" + t.getTeacherid()
				+ "," + t.getDictionaryid() + ")";
		db.update(sql);

	}

}
