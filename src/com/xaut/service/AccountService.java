package com.xaut.service;

import com.xaut.dao.AccountDao;

/**
 * 和账号相关的业务逻辑处理的
 * 
 * @author Administrator
 * 
 */
public class AccountService {

	AccountDao adao = new AccountDao();

	/**
	 * 修改用户密码业务逻辑处理
	 * 
	 * @param phoneNo
	 * @param pass1
	 * @param pass2
	 */
	public void repass(String phoneNo, String pass1, String pass2) {

		// 判断
		if (!pass1.equals(pass2)) {
			throw new RuntimeException("两次密码不一致");
		}

		String dbpass = adao.getPassByPhoneNo(phoneNo);

		if (dbpass.equals(pass1)) {
			throw new RuntimeException("新密码不能够和老密码一样");
		}

		// 修改密码
		adao.repass(phoneNo, pass1);

	}

	public void login(String name, String pass) {
		String dbpass = adao.getPassByPhoneNo(name);
		if (dbpass == null) {// 如果用户名不存在
			throw new RuntimeException("用户名不存在");
		}

		if (!dbpass.equals(pass)) {
			throw new RuntimeException("用户名或密码错误");
		}

	}

}
