package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xaut.entity.Dictionary;
import com.xaut.service.AccountService;
import com.xaut.service.DictionaryService;
import com.xaut.service.TeacherService;

/**
 * 用户登录servlet
 * 
 * @author Administrator
 * 
 */
public class UserLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserLoginServlet() {
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

		// 要输出中文，必须设置编码格式
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		System.out.println("有人要登陆了");
		String sname = request.getParameter("sname");
		String spass = request.getParameter("spass");
		String sf = request.getParameter("sf");

		// 登陆的判断
		if (sf.equals("gly")) {
			// 管理员需要交给管理员业务逻辑处理
			AccountService as = new AccountService();
			// 现在我们采用的模式是 html--》通过表单提交给了 servlet -->servlet 需要返回的不是一个字符串，而是一个页面
			try {
				as.login(sname, spass);
				//需要在转向到leader.jsp页面之前，首先把leader.jsp页面中需要查询的数据查询出来
				//调用 字典业务逻辑类 中查询的方法
				DictionaryService ds=new DictionaryService();
				java.util.List<Dictionary> list= ds.queryAll();
				//并且将查询的结果存放在某一个范围中
				request.setAttribute("data", list);
				//请求转发或者重定向到leader.jsp页面上
				//请求转发才可以获取request范围中的值
				request.getRequestDispatcher("/leader.jsp").forward(request, response);
				
				//response.sendRedirect("../leader.html");
			} catch (Exception e) {

				// 需要将错误的消息反馈给 客户端
				// 首先将消息储存在某一个范围中 request
				request.setAttribute("msg", e.getMessage());

				// response.sendRedirect("../index.html");
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);
			}

		} else {
			// 老师登陆需要交给老师业务逻辑处理
			// 进行老师登录的判断
			TeacherService ts=new TeacherService();
			try {
				ts.teacherLogin(sname, spass);
				request.setAttribute("teacherId", ts.teacherLogin(sname, spass).getTid());
				//转发到欢迎老师登录的界面
				request.getRequestDispatcher("/teacher.jsp").forward(request,
						response);
			} catch (Exception e) {
				// 需要将错误的消息反馈给 客户端
				// 首先将消息储存在某一个范围中 request
				request.setAttribute("msg", e.getMessage());

				// response.sendRedirect("../index.html");
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);
			}
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
