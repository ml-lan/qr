package com.xaut.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xaut.dao.TeacherDao;
import com.xaut.service.TeacherClassService;

/**
 * Servlet implementation class ModifyTeacherPasswd
 */
@WebServlet("/ModifyTeacherPasswd")
public class ModifyTeacherPasswd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyTeacherPasswd() {
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
		int teacherId=Integer.parseInt(request.getParameter("teacherId"));
		
		String ModifyPasswd=request.getParameter("ModifyPasswd");
		
		TeacherDao tdo = new TeacherDao();
		tdo.modifyPasswd(teacherId, ModifyPasswd);
		response.getWriter().println(1);
		
	}

}
