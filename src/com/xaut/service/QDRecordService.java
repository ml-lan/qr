package com.xaut.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.xaut.dao.QDRecordDao;

import com.xaut.dao.StudentDao;
import com.xaut.entity.QDRecord;

import com.xaut.entity.Student;

public class QDRecordService {
	private QDRecordDao qddao = new QDRecordDao();
	private StudentDao sdao = new StudentDao();
	
	public void saveRecord(QDRecord q, int classNo) {

		// 进行一系列的校验逻辑

		// 这个学生是否存在
		int sno = q.getStudentno();

		Student dbs = sdao.queryBySNO(sno);
		if (dbs == null) {// 根据学生的编号找不到学生
			throw new RuntimeException("学生信息不存在");
		}

		// 学生是否属于当前考勤的班级
		// 学生的班级数据 == 当前考勤的班级的编号
		int dbclassno = dbs.getClassno();// 通过学生编号获取到的学生在数据库中的 归属班级编号
		if (dbclassno != classNo) {
			throw new RuntimeException("此学生不属于当前签到班级");
		}

		// 【
		// 只可以签到一次【当前签到时间 > 今天最后一次签到时间 两个小时】
		// 】

		boolean result = qddao.getQDData(q.getStudentno(), q.getQdate1(), q
				.getQstarttime1());
		if (result == true) {
			throw new RuntimeException("当堂课已成功签到,请勿重复签到");  
		}

		SimpleDateFormat f1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat f2 = new SimpleDateFormat("HH:mm:ss");

		q.setQdate1(f1.format(new Date()));
		q.setQtime1(f2.format(new Date()));
		q.setQstarttime1(q.getQstarttime1());

		qddao.saveRecord(q);

	}
	
	public List<QDRecord> queryStudentQDRecord(int stuno) {
		return qddao.queryStudentQDRecord(stuno);
	}

}
