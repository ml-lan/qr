package com.xaut.service;

import java.util.List;

import com.xaut.dao.TeacherClassDao;
import com.xaut.entity.Dictionary;

public class TeacherClassService {

	private TeacherClassDao tcd = new TeacherClassDao();

	public List<Dictionary> queryByTeacherId(int teacherId) {
		return tcd.queryByTeacherId(teacherId);
	}
}
