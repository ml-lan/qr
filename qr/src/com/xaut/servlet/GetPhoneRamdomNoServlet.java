package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xaut.dao.AccountDao;
import com.xaut.util.SmsBase;

public class GetPhoneRamdomNoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetPhoneRamdomNoServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 处理的是用户get方式提交的数据
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获取用户输入的手机号码
		String phoneno = request.getParameter("phoneno");
		System.out.println("已经获取到手机号码:" + phoneno);
		String result;// 表示服务器返回的结果
		if (phoneno.length() != 11) {
			result = "01";
			response.getWriter().print(result);
			return;
		}

		try {
			Long.parseLong(phoneno);// 将字符串转换为 长整形 ，如果无法转换则会引发异常，表示不是数字
		} catch (Exception e) {
			result = "01";
			response.getWriter().print(result);
			return;
		}
		// 接下来就到了，需要查询数据库中是否存在这个手机号码的 校验了
		AccountDao ad = new AccountDao();
		boolean resultp = ad.existPhone(phoneno);
		if (resultp) {
			result = "03";
			//需要向此手机号码发送短信
			SmsBase sms=new SmsBase();
			sms.SendSms(phoneno, "本次验证码是:0268,理工大不会以任何理由询问你的验证码,请勿告知他人");
		} else {
			result = "02";
		}

		response.getWriter().print(result);

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
