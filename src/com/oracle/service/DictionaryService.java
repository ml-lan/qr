package com.oracle.service;

import java.util.List;
import java.util.Map;
import com.oracle.dao.DictionaryDao;
import com.oracle.entity.Dictionary;

public class DictionaryService {

	private DictionaryDao ddao = new DictionaryDao();

	public List<Dictionary> queryAll() {
		return ddao.queryAll();
	}

	/**
	 * 保存字典数据
	 * 
	 * @param d
	 */
	public void saveDictionary(Dictionary d) {
		// 首先进行一些判断
		// 如果已经有相同的数据了，则不能够保存
		boolean result = ddao.queryByParam(d);
		if (result == true) {
			throw new RuntimeException("已经重复的数据请勿重复添加");
		}

		ddao.save(d);

	}
	
	
	public List<String> getYuan() {
		return ddao.getYuan();
	}

	public List<String> getX() {
		return ddao.getX();
	}

	public List<String> getZY() {
		// TODO Auto-generated method stub
		return ddao.getZY();
	}

	public List<String> getNJ() {
		// TODO Auto-generated method stub
		return ddao.getNJ();
	}

	public List<String> getBJ() {
		// TODO Auto-generated method stub
		return ddao.getBJ();
	}

	public  Map<String, Dictionary>  getBJAll() {
		return ddao.getBJAll();
	}
}
