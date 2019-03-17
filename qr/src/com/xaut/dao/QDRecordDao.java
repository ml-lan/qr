package com.xaut.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
		DBManager db = new DBManager();
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

	/**
	 * 查询某一个学生编号 在某一天的某一堂课上是否签到了
	 * 
	 * @param sno
	 * @param day
	 * @param startTime
	 * @return true就是已经签到了
	 */
	public boolean getQDData(int sno, String day, String startTime) {

		try {
			String sql = "select * from qdrecord where studentno=" + sno
					+ " and qdate='" + day + "' and qstarttime='" + startTime
					+ "' ";
			ResultSet rs = db.query(sql);
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	/**
	 * 查询某一个学生的出勤记录
	 * 
	 * @param stuno
	 * @return
	 */
	public List<QDRecord> queryStudentQDRecord(int stuno) {
		List<QDRecord> list = new ArrayList<QDRecord>();
		try {
			String sql = "select  qdate, qstarttime,qtime ,((qdate+qtime)-(qdate+qstarttime)) cqs ,qteachermsg   from qdrecord where studentno=  "
					+ stuno;

			System.out.println("====》》》》》》》" + sql);  
			ResultSet rs = db.query(sql);  
			while (rs.next()) {
				QDRecord q = new QDRecord();
				q.setQdate(rs.getDate("qdate"));
				Time t1 = rs.getTime("qstarttime");
				q.setQstarttime1(t1.toString()); // 我们将数据查询的TIme 转换为了 String
				// 继而封装到了 Qstarttime1
				Time t2 = rs.getTime("qtime");
				q.setQtime1(t2.toString());
				q.setCqstate(rs.getInt("cqs"));
				q.setQteachermsg(rs.getInt("qteachermsg"));
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}
	
	
	
	/**
	 * 查询某一段日期内 某个班级学生的出勤记录
	 * 
	 * @param classno
	 * @param sday
	 * @param eday
	 * @return
	 */
	public List<Object[]> queryDataByClassNo(String classno, String sday,
			String eday) {
		List<Object[]> list = new ArrayList<Object[]>();
		try {
			String sql = "select s.sname,s.ssex,s.sphone, q.qdate,(q.qdate+qtime)>(q.qdate+qstarttime) ss  ,q.qteachermsg  from qdrecord q,student s "
					+ "where q.studentno = s.sno  and  s.classno=" + classno;

			// String sql="select s.sname,s.ssex,s.sphone,
			// q.qdate,(q.qdate+qtime)>(q.qdate+qstarttime) " +
			// " ss ,q.qteachermsg from qdrecord q right join student s on
			// q.studentno = s.sno and s.classno="+classno;
			if (sday != null && !"".equals(sday)) {// 如果你传来了日期 则sql中需要动态增加
				// 日期的条件限制
				sql += "  and q.qdate BETWEEN '" + sday + "' and  '" + eday
						+ "' ";
			}  
			
			System.out.println("班级出勤 查询 SQL -->>> " + sql);
			
			ResultSet rs = db.query(sql);
			while (rs.next()) {
				// 一行数据就是一个数组
				Object[] obj = new Object[6];
				obj[0] = rs.getObject("sname");
				obj[1] = rs.getObject("ssex");
				obj[2] = rs.getObject("sphone");
				obj[3] = rs.getObject("qdate");
				obj[4] = rs.getObject("ss");
				obj[5] = rs.getObject("qteachermsg");
				list.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closeConn();
		}

		return list;
	}

	
}
