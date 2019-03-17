package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.xaut.service.DictionaryService;

public class GetClassStuCountServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetClassStuCountServlet() {
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

		DictionaryService ds = new DictionaryService();
		List<Object[]> list = ds.getClassStuCount();

		List<Data> list2 = new ArrayList<Data>();
		// 将如上的Object转换为一个对象
		for (int i = 0; i < list.size(); i++) {
			Data d = new Data();
			d.setDid(i);
			d.setDclassname(list.get(i)[0].toString());
			d.setDcount(Integer.parseInt(list.get(i)[1].toString()));
			list2.add(d);
		}

		response.getWriter().print(JSON.toJSONString(list2));

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

	class Data {
		private int did;
		private String dclassname;
		private int dcount;

		public int getDid() {
			return did;
		}

		public void setDid(int did) {
			this.did = did;
		}

		public String getDclassname() {
			return dclassname;
		}

		public void setDclassname(String dclassname) {
			this.dclassname = dclassname;
		}

		public int getDcount() {
			return dcount;
		}

		public void setDcount(int dcount) {
			this.dcount = dcount;
		}

	}

}
