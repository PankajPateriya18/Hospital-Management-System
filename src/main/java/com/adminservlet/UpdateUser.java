package com.adminservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entities.User;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			String fullName = req.getParameter("fullName");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			int id = Integer.parseInt(req.getParameter("id"));
			
			User u = new User(id, fullName,email,password);
			
			UserDao dao = new UserDao(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			if(dao.updateUser(u)) {
				session.setAttribute("succMsg", "User Update Successfully...");
				resp.sendRedirect("admin/viewUser.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("admin/viewUser.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
