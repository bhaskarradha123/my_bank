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
</head>
<body>


	<%
	String email = (String) session.getAttribute("loginEmail");

	if (email != null) {
	%>

	<nav>
		<a href="pwdUpdate.jsp"><button>UpdatePassword</button></a> <a
			href="update.jsp"><button>UPDATE</button></a> <a href="delete.jsp"><button>DELETE</button></a>
		<a href="profile.jsp"><button>PROFILE</button></a> <a href="logout"><button>LOGOUT</button></a>
		<a href="checkBalannce.jsp"><button>CHECKBALANCE</button></a> <a
			href="moneyTransfer.jsp"><button>MONEY TRANSFER</button></a> <a
			href="transactions.jsp"><button>SHOW TRANSACTIONS</button></a> <a
			href="account.jsp"><button>ADD ACCOUNT</button></a>



	</nav>

	<%
	} else {
	request.setAttribute("result", "session expired. pls login ");
	request.getRequestDispatcher("login.jsp").include(request, response);
	}
	%>
</body>
</html>