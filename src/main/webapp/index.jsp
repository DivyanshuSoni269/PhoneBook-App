<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.back-img{
	background:url("img/images.jpg");
	width:100%;
	height:80vh;
	background-repeat:no-repeat;
	background-size:cover;
	}
</style>
</head>
<body>
<%@include file="component/allcss.jsp" %>
<%@include file="component/navbar.jsp" %>

 <div class="container-fluid back-img text-center text-success">
 	<h1>Welcome to PhoneBook</h1>
 </div>
 <%@include file="component/footer.jsp" %>
</body>
</html>