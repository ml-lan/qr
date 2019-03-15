package com.xaut.service;

import java.util.ArrayList;
import java.util.List;

import com.xaut.dao.TeacherClassDao;
import com.xaut.dao.TeacherDao;
import com.xaut.entity.Teacher;
import com.xaut.entity.Teacherclass;

/**
 * 教师业务逻辑类
 * 
 * @author Administrator
 * 
 */
public class TeacherService {

	private TeacherDao tdao = new TeacherDao();
	private TeacherClassDao tcdao = new TeacherClassDao();

	/**
	 * 老师登录的逻辑
	 * 
	 * @param tname
	 * @param tpass
	 * @return
	 */
	public Teacher teacherLogin(String tname, String tpass) {

		Teacher t = tdao.queryByTeacherPhone(tname);

		if (t == null) {// 如果老师没有找到
			throw new RuntimeException("查无此人");// java强大的异常处理机制
		}

		// 表示数据库的密码和输入的密码不一致
		if (!t.getTpassword().equals(tpass)) {
			throw new RuntimeException("用户名或者密码错误");// java强大的异常处理机制
		}

		return t;

	}

	/**
	 * 查询老师所有的数据
	 * 
	 * @return
	 */
	public List<Teacher> queryAll() {
		String sql = "select * from teacher";
		return tdao.queryAll();

	}

	/**
	 * 保存老师信息
	 * 
	 * @param t
	 * @param classid
	 *            一个老师对应多个班级
	 */
	public void saveTeacher(Teacher t, String classid[]) {
		// 首先要保存teacher
		int tid = tdao.saveTeacher(t);
		// 保存老师对应的班级
		for (String cid : classid) {
			Teacherclass tc = new Teacherclass();
			tc.setDictionaryid(Integer.parseInt(cid));
			tc.setTeacherid(tid);
			tcdao.save(tc);
		}

	}
	
	
	public List<Teacher> queryClassTeacher(String sno) {
		return tdao.queryClassTeacher(sno);
	}
	//修改老师密码
	public int modifyPasswd(int teacherid,String ModifyPasswd){
		return tdao.modifyPasswd(teacherid,ModifyPasswd);
	}

}
