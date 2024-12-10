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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=(String) req.getParameter("email");
		String password=(String) req.getParameter("password");
		
		UserDao dao=new UserDao(DbConnect.getConn());
		User u=dao.loginUser(email,password);
		HttpSession session=req.getSession();
		if (u!=null) {
			session.setAttribute("user", u);
			res.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("invalidMsg", "Invalid Email and Password..");
			res.sendRedirect("login.jsp");
		}
		
	}
	

}
