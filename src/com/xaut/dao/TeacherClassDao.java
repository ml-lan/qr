package com.xaut.dao;


import com.xaut.entity.Teacherclass;
import com.xaut.util.DBManager;

public class TeacherClassDao {
	
	private DBManager db = new DBManager();

	public void save(Teacherclass t) {

		String sql = "insert into teacherclass(teacherid,dictionaryid) values(" + t.getTeacherid()
				+ "," + t.getDictionaryid() + ")";
		db.update(sql);

	}

}
