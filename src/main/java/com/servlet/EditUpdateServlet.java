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

@WebServlet("/update")
public class EditUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            // Retrieve parameters
            String cidStr = request.getParameter("cid");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mob = request.getParameter("mob");
            String about = request.getParameter("about");

            // Validate parameters
            if (cidStr == null || cidStr.isEmpty() || name == null || name.isEmpty() ||
                email == null || email.isEmpty() || mob == null || mob.isEmpty() ||
                about == null || about.isEmpty()) {
                session.setAttribute("failMsg", "All fields are required!");
                response.sendRedirect("editContact.jsp?cid=" + cidStr);
                return;
            }

            int cid = Integer.parseInt(cidStr);

            // Create a Contact object
            Contact c = new Contact();
            c.setId(cid);
            c.setName(name);
            c.setEmail(email);
            c.setMob(mob);
            c.setAbout(about);

            // Update the contact in the database
            ContactDao dao = new ContactDao(DbConnect.getConn());
            boolean isUpdated = dao.updateContact(c);

            // Redirect based on update result
            if (isUpdated) {
                session.setAttribute("saveMsg", "Your contact was updated successfully.");
                response.sendRedirect("viewContact.jsp");
            } else {
                session.setAttribute("failMsg", "Failed to update contact.");
                response.sendRedirect("editContact.jsp?cid=" + cid);
            }
        } catch (NumberFormatException e) {
            session.setAttribute("failMsg", "Invalid Contact ID.");
            response.sendRedirect("editContact.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
        }
    }
}
