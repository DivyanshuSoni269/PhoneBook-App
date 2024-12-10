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
<div class="container-fluid mt-3">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success">Registeration Form</h4>
<%
String success=(String)session.getAttribute("success");
String error=(String)session.getAttribute("error");
if(success!=null){
%>
<p class="text-success text-center"><%=success %></p>
<%
session.removeAttribute("success");
}

if(error!=null){
%>
<p class="text-danger text-center"><%=error %></p>
<%
session.removeAttribute("error");
}
%>
<form action="register" method="post">
  <div class="form-group">
    <label for="exampleInputName">Enter Name</label>
    <input type="text" class="form-control" name="name" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" name="password" id="exampleInputPassword1">
  </div>
 <div class="text-center">
  <button type="submit" class="btn btn-primary">Register</button>
  </div>
</form>
</div></div></div></div></div>

<div style="margin-top:105px;" class="container-fluid bg-primary text-white p-3 " >
  <h5 class="text-center ">Developed and Design by CodeWith Divyanshu Soni</h5>  
  </div>

</body>
</html>