<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:#f7faf8;">
<%@include file="component/allcss.jsp" %>
<%@include file="component/navbar.jsp" %>

<% if(user==null){
	session.setAttribute("invalidMsg", "Login Please..");
	response.sendRedirect("login.jsp");
	}
%>

<div class="container-fluid mt-2">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card ">
<div class="card-body">
<h4 class="text-center text-success">Add Contact</h4>
<%
String saveMsg=(String)session.getAttribute("saveMsg");
String failMsg=(String)session.getAttribute("failMsg");
if(saveMsg!=null){
%>
<p class="text-success text-center"><%=saveMsg %></p>
<%
session.removeAttribute("saveMsg");
}

if(failMsg!=null){
%>
<p class="text-danger text-center"><%=failMsg %></p>
<%
session.removeAttribute("failMsg");
}
%>
<form method="post" action="update">
<%
int cid = Integer.parseInt(request.getParameter("cid"));
ContactDao dao = new ContactDao(DbConnect.getConn());
Contact c = dao.getContactById(cid);
if (c != null) {
%>
  <input type="hidden" name="cid" value="<%=cid%>"> <!-- Hidden field for cid -->
  <div class="form-group">
    <label for="exampleInputName">Enter Name</label>
    <input value="<%=c.getName() %>" type="text" name="name" class="form-control" id="exampleInputEmail1" required>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" class="form-control" value="<%=c.getEmail()%>" required>
  </div>
  <div class="form-group">
    <label for="MobileNo.">Phone No.</label>
    <input type="text" name="mob" class="form-control" value="<%=c.getMob()%>" required>
  </div>
  <div class="form-group">
    <textarea rows="4" name="about" class="form-control" required><%=c.getAbout()%></textarea>
  </div>
<% } else { %>
  <p class="text-danger">Contact not found!</p>
<% } %>
 <div class="text-center">
  <button type="submit" class="btn btn-success">Update</button>
  </div>
</form>
</div></div></div></div></div>

<div class="container-fluid bg-primary text-white p-3 " >
  <h5 class="text-center ">Developed and Design by CodeWith Divyanshu Soni</h5>  
  </div>

</body>
</html>