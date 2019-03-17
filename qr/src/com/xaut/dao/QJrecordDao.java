package com.xaut.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xaut.entity.QJrecord;
import com.xaut.util.DBManager;
public class QJrecordDao {

	
	private DBManager db = new DBManager();

	public void save(QJrecord q) {

		String sql = "insert into qingjiarecord(studentno,qres,qdate,teacherno,qshiyou) "
				+ " values("
				+ q.getStudentno()
				+ ",'"
				+ q.getQres()
				+ "','"
				+ q.getQdate2()
				+ "',"
				+ q.getTeacherno()
				+ ","
				+ q.getQshiyou() + " )";
		db.update(sql);

	}

	/**
	 * 根据老师的编号和班级的编号，查找没有 回复的请假记录
	 * 
	 * @param tno
	 * @param cno
	 */
	public List<Object[]> getTeacherMessage(String tno, String cno) {

		List<Object[]> list = new ArrayList<Object[]>();
		try {
			String sql = "select	s.sno,	s.sname,	qj.qshiyou,	qj.qdate,"
					+ "	qj.qres, qj.qid from 	qingjiarecord qj,"
					+ "	student s,	dictionary d where "
					+ "	qj.studentno=s.sno and 	s.classno=d.did and qj.teacherno="
					+ tno + " and d.did=" + cno + " and qj.qisread=1";

			ResultSet rs = db.query(sql);

			while (rs.next()) {

				Object[] objs = new Object[6];
				for (int i = 1; i <= 6; i++) {
					objs[i - 1] = rs.getObject(i);
				}
				list.add(objs);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}

	/**
	 * 修改请假的状态
	 * 
	 * @param qjid
	 */
	public void update(String qjid, String state) {
		String sql = "update qingjiarecord q  set qisread=0 ,qresult=" + state
				+ "  where qid=" + qjid;
		db.update(sql);
	}
	
}
