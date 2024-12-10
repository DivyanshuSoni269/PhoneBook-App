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
<form method="post" action="addContact">
<%if(user!=null){ %>
<input type="hidden" name="uid" value="<%=user.getId() %>">
<%} %>
  <div class="form-group">
    <label for="exampleInputName">Enter Name</label>
    <input type="text"  name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
   <div class="form-group">
    <label for="MobileNo.">Phone No.</label>
    <input type="text"  name="mob" class="form-control" id="exampleInputMob" aria-describedby="MobHelp">
  </div>
  <div class="form-group">
    <textarea rows="4"  name="about" cols="" placeholder="Edit About..."class="form-control"></textarea>
  </div>
 <div class="text-center">
  <button type="submit" class="btn btn-success">Save Contact</button>
  </div>
</form>
</div></div></div></div></div>

<div class="container-fluid bg-primary text-white p-3 " >
  <h5 class="text-center ">Developed and Design by CodeWith Divyanshu Soni</h5>  
  </div>

</body>
</html>