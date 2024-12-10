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

@WebServlet("/addContact")
public class ContactServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=(String) request.getParameter("name");
		String email=(String) request.getParameter("email");
		String mob=(String) request.getParameter("mob");
		String about=(String) request.getParameter("about");
		int uid=Integer.parseInt(request.getParameter("uid"));
	Contact contact=new Contact(name,email,mob,about,uid);
	ContactDao dao=new ContactDao(DbConnect.getConn());
	
	HttpSession session=request.getSession();
	boolean f=dao.saveContact(contact);
	if (f) {
		session.setAttribute("saveMsg", "Your Contact Saved Successful..");
		response.sendRedirect("addContact.jsp");
	}
	else
	{
		session.setAttribute("failMsg", "Something Went Wrong..");
		response.sendRedirect("addContact.jsp");
	}
	
	} 
}
