package com.xaut.service;

import com.xaut.dao.QDRecordDao;
import com.xaut.dao.StudentDao;
import com.xaut.entity.Student;

public class StudentService {
	private StudentDao sdao = new StudentDao();
	private QDRecordDao qddao=new QDRecordDao();

	public void save(Student s) {
		// 首先要进行数据的判断
		// 比如学生信息是否存在

		if (sdao.queryBySphone(s.getSphone()) == true) {
			throw new RuntimeException("学生手机号已经被占用");
		}

		sdao.saveStudent(s);
	}

	public Student studentLogin(String sphone, String spass) {

		Student s = sdao.queryBySphone2(sphone);
		if (s == null) {
			throw new RuntimeException("查无此人");
		}

		if (!s.getSpassword().equals(spass)) {
			throw new RuntimeException("用户名或密码错误");
		}

		return s;
	}

	/**
	 * 得到班级的总人数和已经签到的学生数量
	 * 
	 * @return
	 */
	public int[] getStuCountAndQDCount(String classno,String day,String time) {
		//某个班的总人数
		int totleCount = sdao.queryStudentCountByClassNo(classno);
		//某个班 某一天 某个上课时间段 已有的敲到数据
		int qdcount=qddao.queryQDCount(Integer.parseInt(classno), day, time);
		
		int[] results={totleCount,qdcount};
		
		return results;
		
	}

}
