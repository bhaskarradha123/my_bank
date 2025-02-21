<%@page import="com.ty.dto.Transaction"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@page import="com.ty.dto.BankAccount"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #ffffff;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
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
        width: 140%;
        max-width: 1000px;
        text-align: center;
        margin-top: 50px;
    }
    
    .heading {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #3a8dde;
    }
    
    .input, select {
        width: 50%;
        padding: 10px;
        margin: 10px 0 0 2px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    
    .table-container {
        margin-top: 20px;
        overflow-x: auto;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
    }
    
    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
        transition: background 0.3s;
    }
    
    th {
        background: #3a8dde;
        color: white;
    }
    
    tr:nth-child(even) {
        background: #f2f2f2;
    }
    
    tr:hover {
        background-color: #d0e3ff;
    }
    
    .submit-button {
        background: #3a8dde;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    
    .submit-button:hover {
        background: #2f75b5;
    }

</style>

</head>
<body>

	<a href="dashboard.jsp" class="dashboard-button">DASHBOARD</a>
    <div class="container">

	<%
	String email = (String) session.getAttribute("loginEmail");
	List<BankAccount> bankAccounts = new BankAccountDao().fetchBankByEmail(email);

	if (bankAccounts.size() > 0) {
	%>


        <div class="heading">Transaction History</div>

	<form action="transactions" method="post">

		<label for="account">Select Bank Account:</label> <select
			name="account" id="account" required>
			<option value="">-- Choose Account --</option>
			<%
			if (bankAccounts.size() > 0) {
				for (BankAccount account : bankAccounts) {
			%>
			<option value="<%=account.getAccountNumber()%>">
				<%=account.getBankName()%> -
				<%=account.getAccountNumber()%> (Balance:
				<%=account.getBalance()%>)
			</option>
			<%
			}
			}
			%>
		</select>             <input class="submit-button" type="submit" value="SHOW">
		
	</form>




	<%
	}

	else {
	%>
	<div class="msg">You dont have any accounts to show transactions</div>
	<%
	}
	%>

	<table class="table-container" >
		<tr>
			<th>Sender</th>
			<th>Receiver</th>
			<th>Phone</th>
			<th>Amount</th>
			<th>Mode</th>
			<th>Type</th>
			<th>Date</th>
			<th>Status</th>
			<th>Remarks</th>
		</tr>
		<tr>

			<%
			List<Transaction> data = (List<Transaction>) request.getAttribute("data");
			if (data !=null) {
				for (Transaction t : data) {
			%>



			<td><%=t.getSenderAccountNumber()%></td>
			<td><%=t.getReceiverAccountNumber()%></td>
			<td><%=t.getReceiverPhoneNumber()%></td>
			<td><%=t.getAmount()%></td>
			<td><%=t.getTransactionMode()%></td>
			<td><%=t.getTransactionType()%></td>
			<td><%=t.getTransactionDate()%></td>
			<td><%=t.getStatus()%></td>
			<td><%=t.getRemarks()%></td>





		</tr>

<%} %>
	</table>

	<%
	
	} else {
		String msg=(String)request.getAttribute("msg");
		if(msg!=null){
	%>

	<h3 class="msg"><%=msg %></h3>

	<%
	}}
	%>

</div>


</body>
</html>