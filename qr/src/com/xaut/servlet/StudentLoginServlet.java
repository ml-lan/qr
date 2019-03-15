package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xaut.entity.Student;
import com.xaut.service.StudentService;

public class StudentLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public StudentLoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String sphone = request.getParameter("sphone");
		String spass = request.getParameter("spass");
		// 登录的操作了
		StudentService ss = new StudentService();
		Student dbstudent;
		try {
			dbstudent = ss.studentLogin(sphone, spass);
			// 应该将学生的信息储存在session、中，以便于后续的会话跟踪
			request.setAttribute("dbstudent", dbstudent);
			request.setAttribute("msg", "登录成功");

			// 当学生正确登录了之后，需要给前端下发一个数据
			// 用以表示学生已经登录，以后不需要登录
			// 会话跟踪 cookie
			Cookie c1 = new Cookie("islogin", "true");
			Cookie c2 = new Cookie("sphone", sphone);
			Cookie c3 = new Cookie("sno", dbstudent.getSno()+"");
			c1.setMaxAge(60 * 60 * 24 * 30 * 4);
			c1.setPath("/");

			c2.setMaxAge(60 * 60 * 24 * 30 * 4);    
			c2.setPath("/");
			
			c3.setMaxAge(60 * 60 * 24 * 30 * 4);
			c3.setPath("/");

			
			   
			
			// 将服务器端内存中的对象下发到客户端中
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);

			/*request.getRequestDispatcher("/studentPhone.jsp?date="+new Date()).forward(request,
					response);*/
			//此处不可以使用请求转发
			//因为cookie在此处由服务器下发给客户端
			//当使用请求转发的时候，表示由服务器 带着客户端的请求参数继续请求下一个页面，然而cookie还没有被真正的下发到客户端
			//所以无法获取
			//但重定向不一样因为重定向客户端会请求服务器两次
			response.sendRedirect("../studentPhone.jsp");  
			
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());

			request.getRequestDispatcher("/studentLogin.jsp?date="+new Date()).forward(request,
					response);

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
