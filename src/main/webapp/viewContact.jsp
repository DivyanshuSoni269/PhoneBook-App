<%@page import="com.conn.DbConnect"%>
<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ContactDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">.crd-ho:hover{background-color:#f7f7f7;}</style>
</head>
<body>
<%@include file="component/allcss.jsp" %>
<%@include file="component/navbar.jsp" %>
<% if(user==null){
	session.setAttribute("invalidMsg", "Login Please..");
	response.sendRedirect("login.jsp");
	}
%>
<%
String saveMsg=(String)session.getAttribute("saveMsg");
if(saveMsg!=null){
%>
<div class="alert alert-success" role="alert" id="alert-box"><%=saveMsg %></div>
<script>
    // Hide the alert automatically after 3 seconds
    setTimeout(() => {
        document.getElementById('alert-box').style.display = 'none';
    }, 3000);
</script>
<%
session.removeAttribute("saveMsg");
}
%>

<div class="container">
<div class="row p-4">
<%
if(user!=null){
ContactDao dao=new ContactDao(DbConnect.getConn());
List<Contact> contact=dao.getAllContact(user.getId());
for(Contact c:contact){
	

%>

<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body">
<h5>Name: <%=c.getName() %></h5>
<p>Ph no: <a href="tel:<%=c.getMob() %>"><%=c.getMob() %></a></p>
<p>Email: <a href="mailto:<%=c.getEmail() %>"><%=c.getEmail() %></a></p>
<p>About: <%=c.getAbout() %></p>

<div class="text-center text-white">
<a href="editContact.jsp?cid=<%=c.getId()%>" class="btn btn-success">Edit</a>
<a href="delete?cid=<%=c.getId()%>"class="btn btn-danger">Delete</a>
</div>
</div>
</div>
</div>
<%}} %>
</div>
</div>
</body>
</html>