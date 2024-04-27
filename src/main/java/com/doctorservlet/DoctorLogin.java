package com.doctorservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entities.Doctor;

@WebServlet("/doctorlogin")
public class DoctorLogin extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			Doctor d = dao.login(email, password);
			
			if(d != null) {
				session.setAttribute("doctorobj", d);
				resp.sendRedirect("doctor/index.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Invalid Email & Password");
				resp.sendRedirect("doctor_login.jsp");
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
