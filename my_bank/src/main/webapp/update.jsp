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
	String email = (String) session.getAttribute("loginEmail");
	UserDao dao = new UserDao();
	User data = dao.fetchProfileByEmail(email);
	if (email != null && data != null) {
	%>

	<form action="update" method="post">
		<input required="required" type="text" name="firstName"
			value="<%=data.getFirstname()%>">
		 <input required="required" type="text" name="lastName" value="<%=data.getLastname()%>">
		<select required="required" name="gender">
			<option value="<%= data.getGender()%>"><%= data.getGender()%></option>
			<option value="male">Male</option>
			<option value="female">Female</option>
			<option value="other">Other</option>
		</select> 
		<input required="required"  type="text" name="address" value="<%= data.getAddress()%>"> 
		<input required="required"  type="number" name="age" value="<%= data.getAge()%>" min="1">
		<input required="required" class="input" type="tel" name="phone" value="<%= data.getPhone()%>" pattern="[0-9]{10}"> 
        <input required="required" class="input" type="email" name="email" value="<%= data.getEmail()%>"> 
		<input	 type="submit" value="EDIT">
	</form>
<a href="dashboard.jsp"><button>DASHBOARD</button></a>



	<%
	} else
	request.getRequestDispatcher("login.jsp").forward(request, response);
	%>
</body>
</html>