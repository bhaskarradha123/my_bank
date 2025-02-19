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
</head>
<body>

	<%
	String email = (String) session.getAttribute("loginEmail");
	List<BankAccount> bankAccounts = new BankAccountDao().fetchBankByEmail(email);

	if (bankAccounts.size() > 0) {
	%>

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
		</select> <input type="submit" value="SHOW">
	</form>



	<%
	}

	else {
	%>
	<div>You dont have any accounts to show transactions</div>
	<%
	}
	%>

	<table border="2px solid black">
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

	<h3><%=msg %></h3>

	<%
	}}
	%>



</body>
</html>