<%@page import="com.ty.dto.User"%>
<%@page import="com.ty.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String msg = (String) request.getAttribute("msg");

	if (msg != null) {
	%>
	<p><%=msg %></p>
	<%} %>
	<%
	String email = (String) session.getAttribute("loginEmail");

	if (email != null) {
	%>

    <form action="delete" method="post">
        <input name="email" value="<%=email %>" hidden="hidden" >
    
    <input type="text" name="pwd" placeholder="enter pwd to delete your account">
    <input type="submit" value="DELETE"> 
    
    </form>
    
    <a href="dashboard.jsp"><button>DASHBOARD</button></a>
    
	<%
	}
	%>
</body>
</html>