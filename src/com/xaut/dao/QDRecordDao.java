package com.xaut.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.xaut.entity.QDRecord;
import com.xaut.util.DBManager;

public class QDRecordDao {

	private DBManager db = new DBManager();

	public void saveRecord(QDRecord q) {
		String sql = " insert into qdrecord(studentno,qdate,qtime,qstarttime) "
				+ "values( " + q.getStudentno() + ", '" + q.getQdate1()
				+ "' , '" + q.getQtime1() + "' , '" + q.getQstarttime1()
				+ "' ) ";

		db.update(sql);

	}

	/**
	 * 查询某个班级，某一天，某一堂课的签到学生数量
	 * 
	 * @param classno
	 * @param day
	 *            xxxx-xx-xx
	 * @param time
	 *            xx:xx:xx
	 * @return
	 */
	public int queryQDCount(int classno, String day, String time) {
		int count = 0;
		try {
			String sql = "select count(studentno) countsno from "
					+ " student s,qdrecord qd where s.sno=qd.studentno and "
					+ " s.classno=" + classno + " and qd.qdate= '" + day + "' "
					+ "  and qd.qstarttime='" + time + "' ";

			ResultSet rs = db.query(sql);
			while (rs.next()) {
				count = rs.getInt("countsno");
			}
		} catch (SQLException e) {
 			e.printStackTrace();
		} finally {
			db.closeConn();
		}

		return count;
	}
	
	
}
