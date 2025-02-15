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


	<form action="forgetPwd" method="post">
		<input required="required" class="input" type="email" name="email"
			placeholder="enter email to update pwd"> <input type="submit"
			value="SUBMIT">
	</form>






</body>
</html>