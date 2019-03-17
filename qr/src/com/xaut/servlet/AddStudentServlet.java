package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xaut.entity.Student;
import com.xaut.service.StudentService;

public class AddStudentServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddStudentServlet() {
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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String sphone = request.getParameter("sphone");
		String sname = request.getParameter("sname");
		String ssex = request.getParameter("ssex");
		String spass = request.getParameter("spass");
		// 在此处省略了服务器端数据的教研
		
		StudentService ss = new StudentService();

		// 可以从session中获取到 班级的编号，也就是二维码中隐藏的编号
		String did = request.getSession().getAttribute("sessionClassID")
				.toString();

		Student s = new Student();
		s.setClassno(Integer.parseInt(did));// 班级编号
		s.setSname(sname);
		s.setSpassword(spass);
		s.setSphone(sphone);
		s.setSsex(Integer.parseInt(ssex));
		try {
			ss.save(s);
			response.getWriter().print("录入信息成功了");
		} catch (Exception e) {
			e.printStackTrace();       
			response.getWriter().print(e.getMessage());
		}

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
