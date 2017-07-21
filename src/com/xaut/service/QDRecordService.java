package com.xaut.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.xaut.dao.QDRecordDao;
import com.xaut.entity.QDRecord;

public class QDRecordService {
	private QDRecordDao qddao = new QDRecordDao();

	public void saveRecord(QDRecord q) {

		
		SimpleDateFormat f1=new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat f2=new SimpleDateFormat("HH:mm:ss");
		
		q.setQdate1(f1.format(new Date()));
		q.setQtime1(f2.format(new Date()));
		q.setQstarttime1(q.getQstarttime1());

		qddao.saveRecord(q);

	}

}
