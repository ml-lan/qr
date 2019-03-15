package com.xaut.service;


import java.util.List;

import com.xaut.dao.QJrecordDao;
import com.xaut.entity.QJrecord;
public class QJRecordService {

	
	private QJrecordDao qdao = new QJrecordDao();

	public void save(QJrecord q) {
		qdao.save(q);
	}

	public List<Object[]> getTeacherMessage(String tno, String cno) {
		return qdao.getTeacherMessage(tno, cno);
	}

	public void update(String qjid, String state) {
		qdao.update(qjid, state);
	}
}
