package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EWImagePathServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EWImagePathServlet() {
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
		String val = request.getParameter("path");
		// 生成一个随机数
//		String randomUUID = UUID.randomUUID().toString();
		String randomUUID = System.currentTimeMillis()+"";

		// 将生成的随机数存储在session范围中
		// 这里储存在session中，只是对于 一个终端有效
		// request.getSession().setAttribute("randomUUID", randomUUID);
		// 向application范围中存放数据

		Map<String, String> map = new HashMap<String, String>();
		ServletContext context = getServletContext();// 这是javaweb中最大的范围叫做application，意味着所有的终端都可以进行访问
		if (context.getAttribute("random") == null) {
			getServletContext().setAttribute("random", map);// 当范围中第一次存放的时候
		} else {
			map = (Map<String, String>) context.getAttribute("random"); // 不是第一次
		}
		// 第一个参数是班级，第二个参数是 随机数

		int indexd = val.indexOf("=");
		String tempVal = val.substring(indexd + 1);

		int dindex = tempVal.indexOf("=");
		int dindex2 = tempVal.indexOf(",");
		String classno = tempVal.substring(dindex + 1, dindex2);

		map.put(classno, randomUUID);
		System.out.println("application-->" + classno + "\t\t" + randomUUID);
		context.setAttribute("random", map);

		val += "," + randomUUID;
		System.out.println("【新的二维码地址已经生成--->>>】" + val);
		response.getWriter().print(val);

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
