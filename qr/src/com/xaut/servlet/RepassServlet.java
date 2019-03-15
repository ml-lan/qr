package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xaut.service.AccountService;

public class RepassServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RepassServlet() {
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
	
		//要输出中文，必须设置编码格式
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");   
		
		
		// 就是修改密码
		// 密码如何修改呢？
		// 取值
		String phoneno = request.getParameter("phoneno");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");

	
		
		PrintWriter pw = response.getWriter();

		AccountService as = new AccountService();
		try {
			as.repass(phoneno, pass1, pass2);
			pw.print("修改密码成功");
		} catch (Exception e) {
			pw.print(e.getMessage());
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
