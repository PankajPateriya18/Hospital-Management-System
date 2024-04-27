package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entities.Appointment;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userid"));
		String fullName = req.getParameter("fullName");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appointDate = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String disease = req.getParameter("disease");
		int doctorId = Integer.parseInt(req.getParameter("doct"));
		String address = req.getParameter("address");
		
		Appointment ap = new Appointment(userId,fullName,gender,age,appointDate,email,phno,disease,doctorId,address,"Pending");
		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		
		if(dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment Successfully");
			resp.sendRedirect("user_appointment.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something Wrong on Server");
			resp.sendRedirect("user_appointment.jsp");
		}
		
	}
}
