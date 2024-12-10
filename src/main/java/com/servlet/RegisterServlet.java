package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=(String) request.getParameter("name");
		String email=(String) request.getParameter("email");
		String password=(String) request.getParameter("password");
		User u=new User(name,email,password);
		UserDao dao=new UserDao(DbConnect.getConn());
		boolean f=dao.UserRegister(u);
		HttpSession session=request.getSession();
		if (f) {
			session.setAttribute("success", "User Register Sucessfully..");
			response.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("error", "Something Server Error..");
			response.sendRedirect("register.jsp");
		}
	}

}
