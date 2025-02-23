<%@page import="com.ty.dto.BankAccount"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Check Balance</title>
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

.msg {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: none;
	border-radius: 5px;
	background: rgba(230, 219, 219, 0.6);
	color: rgb(249, 17, 17);
	font-size: 16px;
	transition: all 0.3s ease-in-out;
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

@keyframes fadeInScale {
    0% {
        opacity: 0;
        transform: scale(0.8);
    }
    100% {
        opacity: 1;
        transform: scale(1);
    }
}

.balance {
    font-size: 24px;
    font-weight: bold;
    color: #28a745;
    animation: fadeInScale 0.8s ease-in-out;
}

.balance-button {
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

.balance-button:hover {
	background: #2f75b5;
}
</style>
</head>
<body>
	<a href="dashboard.jsp" class="dashboard-button">DASHBOARD</a>

	<div class="container">
		<%
		String pinMsg = (String) request.getAttribute("balanceMsg");
		if (pinMsg != null) {
		%>
		<p >Your current balance is:</p>
		<h3 class="balance"><%=pinMsg%></h3>
		<%
		}
		%>

		<%
		String wrongPin = (String) request.getAttribute("wrongPin");
		if (wrongPin != null) {
		%>
		<p class="msg">Wrong PIN. Please try again.</p>
		<%
		}
		%>

		<div class="heading">CHECK BALANCE</div>
		<%
		String email = (String) session.getAttribute("loginEmail");
		List<BankAccount> list = new BankAccountDao().fetchBankByEmail(email);
		
		%>

		<form method="post" action="checkBalance">
			<select id="bankName" class="input" name="bankName" required>
				<option value="">-- Select Bank --</option>
				<%
				if (!list.isEmpty()) {
				for (BankAccount a : list) {
				%>
				<option value="<%=a.getBankName()%>:<%=a.getAccountNumber()%>">
					<%=a.getBankName()%> - <%=a.getAccountNumber()%>
				</option>
				<%
				}
				%>
			</select> <input type="password" class="input" id="pin" name="pin"
				pattern="\d{4}" title="Enter a 4-digit PIN" placeholder="Enter Pin"
				required> <input type="submit" class="balance-button"
				value="Check Balance">
		</form>
		<%
		} else {
		request.setAttribute("msg", "You don't have an account to check balance. Please add an account first.");
		 request.getRequestDispatcher("account.jsp").forward(request, response)	;	}
		%>
	</div>

</body>
</html>
