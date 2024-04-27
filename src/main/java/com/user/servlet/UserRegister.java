package com.user.servlet;

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

@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User u = new User(fullName, email, password);

			UserDao dao = new UserDao(DBConnect.getConn());

			HttpSession session = req.getSession();

			boolean b = dao.register(u);

			if (b == true) {
				session.setAttribute("schMsg", "Register Successfully");

				resp.sendRedirect("signup.jsp");
				System.out.println("Register Successfull");
			} else {
				session.setAttribute("errMsg", "Something wrong went on server");

				resp.sendRedirect("signup.jsp");
				System.out.println("Register Not Successfull");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
