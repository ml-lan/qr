package com.xaut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xaut.entity.QJrecord;
import com.xaut.service.QJRecordService;
import com.sun.org.apache.xerces.internal.parsers.IntegratedParserConfiguration;

/**
 * Servlet implementation class AddSQQJServlet
 */
@WebServlet("/AddSQQJServlet")
public class AddSQQJServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSQQJServlet() {
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

		String stuno = request.getParameter("stuno");
		String sqqj_day = request.getParameter("sqqj_day");
		String sqqj_sy = request.getParameter("sqqj_sy");
		String sqqj_ls = request.getParameter("sqqj_ls");
		String sqqj_bz = request.getParameter("sqqj_bz");

		QJrecord q = new QJrecord();
		q.setQdate2(sqqj_day);
		q.setQres(sqqj_bz);
		q.setQshiyou(Integer.parseInt(sqqj_sy));
		q.setStudentno(Integer.parseInt(stuno));
		q.setTeacherno(Integer.parseInt(sqqj_ls));

		QJRecordService qs = new QJRecordService();
		qs.save(q);

		response.getWriter().println("success");
	}

}
