package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

import com.xaut.entity.QDRecord;
import com.xaut.service.QDRecordService;

public class QDServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public QDServlet() {
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
		String sno = request.getParameter("sno");
		 
		String stime=request.getSession().getAttribute("startTime").toString();
		String uuid = request.getParameter("uuid");// 获取到用户传入的uuid值

		QDRecordService qs = new com.xaut.service.QDRecordService();
		QDRecord q = new QDRecord();
		q.setQstarttime1(stime);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		q.setQdate1(sdf.format(new Date()));
		
		// 从session中获取二维码中对应的当前考勤班级编号
		int classNo = Integer.parseInt(request.getSession().getAttribute(
						"sessionClassID").toString());

		// 用用户传递的随机数和application范围中的值进行比较
		Map<String, String> map = (Map<String, String>) getServletContext()
				.getAttribute("random");
		String applicationRandom = map.get(classNo + "");// 通过班级的编号，获取这个班级对应的
															// 随机数
		System.out.println("学生开始签到了:" + uuid + "\t\t" + applicationRandom);
		
		if (!uuid.equals(applicationRandom)) {
			System.out.println("不合法的签到--->>>>>>>> :" + uuid + "\t\t"
					+ applicationRandom + "\t\t" + sno);

			response.getWriter().println("二维码已失效或者二维码非法");
			return;
		}
		try {
			q.setStudentno(Integer.parseInt(sno));

			qs.saveRecord(q, classNo);
			response.getWriter().println("今日签到成功");// 如果是成功签到，服务器返回
			// 今日签到成功，只要不是这个信息，则表示错误
			System.out.println(sno + " 签到成功");
		} 
		catch (Exception e){

			System.err.println("签到过程中发生了错误:" + e.getMessage());

			// 注意目前有两种可能发生异常 1 学生编号不存在，2 学生不属于当前考勤的班级
			if (e.getMessage().equals("学生信息不存在")) {

				// 将客户端的cookie清空
				Cookie cks[] = request.getCookies();
				for (Cookie cookie : cks) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
				response.getWriter().println(e.getMessage());
			}

			else if (e.getMessage().startsWith("For input string")) {

				// 将客户端的cookie清空
				Cookie cks[] = request.getCookies();
				for (Cookie cookie : cks) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
				response.getWriter().println("签到过程中发生了错误,请重新登陆");
			} else {
				response.getWriter().println(e.getMessage());

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
