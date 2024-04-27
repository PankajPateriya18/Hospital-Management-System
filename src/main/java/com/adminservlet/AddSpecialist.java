package com.adminservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecalistDao;
import com.db.DBConnect;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String specName = req.getParameter("specName");
		SpecalistDao dao = new SpecalistDao(DBConnect.getConn());
		boolean f = dao.addSpecialist(specName);
		
		HttpSession session = req.getSession();		
		
		if(f) {
			session.setAttribute("succ", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("admin/index.jsp");
		
		}
		
	}
	
}
