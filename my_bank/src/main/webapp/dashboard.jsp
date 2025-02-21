<%@page import="com.ty.dao.UserDao"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@page import="com.ty.dto.BankAccount"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
  body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #ffffff;
    }
    
    .navbar {
        background: #3a8dde;
        color: white;
        padding: 15px;
        text-align: center;
        font-size: 20px;
        position: relative;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    
    .profile-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: white;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #3a8dde;
        font-size: 18px;
        font-weight: bold;
        margin-left: 15px;
    }
    
    .menu {
        width: 60px;
        height: 50px;
        background: #3a8dde;
        color: white;
        text-align: center;
        line-height: 50px;
        font-size: 20px;
        cursor: pointer;
        transition: background 0.3s;
    }
    
    .menu:hover {
        background: #2f75b5;
    }
    
    .offcanvas {
        position: fixed;
        top: 0;
        right: -250px;
        width: 250px;
        height: 100%;
        background: #3a8dde;
        box-shadow: -2px 0 10px rgba(0, 0, 0, 0.2);
        transition: right 0.5s ease-in-out;
        padding-top: 20px;
        overflow: hidden;
    }
    
    .navbar:hover + .offcanvas, .offcanvas:hover {
        right: 0;
    }
    
    .offcanvas a {
        display: block;
        padding: 15px;
        text-decoration: none;
        color: white;
        font-size: 18px;
        transition: background 0.3s, transform 0.2s;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
    .offcanvas a:hover {
        background: #2f75b5;
        transform: translateX(5px);
    }
    
    .submenu {
        display: none;
        padding-left: 20px;
        transition: max-height 0.3s ease-out;
    }
    
    .profile:hover .submenu, .account:hover .submenu {
        display: block;
        animation: fadeIn 0.5s ease-in-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .submenu a {
        font-size: 16px;
    }
    
    footer {
        text-align: center;
        padding: 20px;
        background: #3a8dde;
        color: white;
        position: absolute;
        bottom: 0;
        width: 100%;
    }
</style>
</head>
<body>



	<%
	String email = (String) session.getAttribute("loginEmail");
      String name= new  UserDao().fetchProfileByEmail(email).getFirstname();
	if (email != null&&name!=null) {
	%>
	  <div class="navbar">
        <div class="profile-icon">U</div>
        Welcome, <%=name %>
        <div class="menu">☰</div>
    </div>

	<div class="offcanvas" id="offcanvasMenu">
		<div class="profile">
			<a href="#">Profile</a>
			<div class="submenu">
				<a href="update.jsp">Update</a>
				 <a href="delete.jsp">Delete</a>
				  <a href="pwdUpdate.jsp">Update Password</a> 
				  <a href="profile.jsp">Profile</a>
			</div>
		</div>
		<div class="account">
			<a href="#">Account</a>
			<div class="submenu">
				<a href="account.jsp">Create Account</a>
				 <a href="checkBalance.jsp">CheckBalance</a> 
				 <a href="moneyTransfer.jsp">Money Transfer</a> 
				 <a href="transactions.jsp">Transactions</a>
			</div>
		</div>
		<a href="logout">Logout</a>
	</div>

	<footer>
		<p>&copy; 2025 MyBank. All rights reserved.</p>
	</footer>
	<%
	} else {
	request.setAttribute("result", "session expired. pls login ");
	request.getRequestDispatcher("login.jsp").include(request, response);
	}
	%>
</body>
</html>
