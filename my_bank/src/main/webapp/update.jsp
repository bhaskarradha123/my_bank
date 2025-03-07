<%@page import="com.ty.dto.User"%>
<%@page import="com.ty.dao.UserDao"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #ffffff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        position: relative;
    }
    
    .dashboard-button {
        position: absolute;
        top: 20px;
        left: 20px;
        background: #3a8dde;
        color: white;
        padding: 10px 15px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        box-shadow: 0 0 15px rgba(25, 3, 150, 0.7);
        
    }
    
    .dashboard-button:hover {
        background: #2f75b5;
    }
    
    .container {
        background: #f8f9fa;
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 0 15px rgba(25, 3, 150, 0.5);
        width: 300px;
        text-align: center;
    }
    
    .heading {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #3a8dde;
    }
    
    .input {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    
    .update-button {
        margin-top: 20px;
        background: #3a8dde;
        color: white;
        padding: 12px;
        border: none;
        width: 100%;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    
    .update-button:hover {
        background: #2f75b5;
    }
</style>
</head>
<body>
    <a href="dashboard.jsp" class="dashboard-button">DASHBOARD</a>

<%
	String email = (String) session.getAttribute("loginEmail");
	User user = new UserDao().fetchProfileByEmail(email);
	if (email != null && user != null) {
	%>
    <div class="container">
        <div class="heading">UPDATE FORM</div>
        <form action="update" method="post">
            <input class="input" type="email" name="email"  value="<%= user.getEmail()%>"  required  readonly>
            <input class="input" type="text" name="firstName"  value="<%=user.getFirstname() %>"  required >
            <input class="input" type="text" name="lastName"  value="<%=user.getLastname() %>" required >
            <select class="input" name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <input class="input" type="text" name="address"  value="<%=user.getAddress() %>"  required >
            <input class="input" type="number" name="age" value="<%=user.getAge() %>"  required min="1" >
            <input class="input" type="tel" name="phone"  value="<%=user.getPhone() %>"  required pattern="[0-9]{10}" >
            <input class="update-button" type="submit" value="EDIT">
        </form>
    </div>
<%}%>
</body>
</html>