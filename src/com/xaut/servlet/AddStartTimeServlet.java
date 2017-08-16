package com.xaut.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.xaut.util.DBManager;

/**
 * Servlet implementation class AddStartTimeServlet
 */
@WebServlet("/AddStartTimeServlet")
public class AddStartTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBManager db = new DBManager();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStartTimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 取得用户输入的值
		int teacherid  = Integer.parseInt(request.getParameter("teacherid"));
		String courseTimeArrJson = request.getParameter("courseTimeArrJson");
		System.out.print(teacherid);
		String tem = courseTimeArrJson.substring(1,courseTimeArrJson.length()-1);
 		
		try {
			for(int i=0;i<tem.split(",").length;i++)
			{
				
				String time=tem.split(",")[i];
			
				String sql="insert INTO starttime (stime,tid) values("+ time +","+teacherid+")";
				db.update(sql);
			}
			db.closeConn();
			response.getWriter().println(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
