package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.entity.Contact;

/**
 * Servlet implementation class deleteContactServlet
 */
@WebServlet("/delete")
public class deleteContactServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		
		ContactDao dao=new ContactDao(DbConnect.getConn());
		boolean f=dao.deleteContact(cid);
		HttpSession session=request.getSession();
		
		if (f) {
			session.setAttribute("saveMsg", "Your Contact Delete Successful..");
			response.sendRedirect("viewContact.jsp");
		}
		else
		{
			session.setAttribute("failMsg", "Something Went Wrong..");
			response.sendRedirect("viewContact.jsp");
		}
	}

	

}
