package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.xaut.entity.Dictionary;
import com.xaut.entity.Teacher;
import com.xaut.service.DictionaryService;
import com.xaut.service.TeacherService;

public class TeacherAddServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TeacherAddServlet() {
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
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 取得用户输入的值
		String tname = request.getParameter("tname");
		String tsex = request.getParameter("tsex");
		String tphone = request.getParameter("tphone");
		String tpass = request.getParameter("tpass");

		String[] tclass = request.getParameterValues("tclass");

		Teacher t = new Teacher();
		t.setTname(tname);
		t.setTpassword(tpass);
		t.setTphone(tphone);
		t.setTsex(Integer.parseInt(tsex));

		TeacherService ts = new TeacherService();
		ts.saveTeacher(t, tclass);

		request.setAttribute("msg", "添加老师成功");
		request.setAttribute("flag", "2");

		// 需要在转向到leader.jsp页面之前，首先把leader.jsp页面中需要查询的数据查询出来
		// 调用 字典业务逻辑类 中查询的方法
		DictionaryService ds = new DictionaryService();
		java.util.List<Dictionary> list = ds.queryAll();
		// 并且将查询的结果存放在某一个范围中
		request.setAttribute("data", list);

		request.getRequestDispatcher("/leader.jsp").forward(request, response);
		
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
