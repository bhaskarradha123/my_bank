<%@page import="com.ty.dto.BankAccount"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html>
<head>
    <title>Send Money to Bank Account</title>
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

.transfer-button {
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

.transfer-button:hover {
	background: #2f75b5;
}
</style>
</head>
<body>

	<a href="dashboard.jsp" class="dashboard-button">DASHBOARD</a>

	<div class="container">

<% String status=(String)request.getAttribute("status");
if(status!=null){
%>

<p class="msg"><%=status %></p>

<%}
   String email=(String)session.getAttribute("loginEmail");
    List<BankAccount> bankAccounts =new BankAccountDao ().fetchBankByEmail(email) ;
%>

			<div class="heading">SEND MONEY TO BANK ACCOUNT </div>

    <form action="bankTransfer" method="post">
        <select name="senderAccount" class="input" required>
            <option value="">-- Choose Account --</option>
            <% 
                if (bankAccounts.size()>0) {
                    for (BankAccount account : bankAccounts) {
            %>
                <option value="<%= account.getAccountNumber() %>">
                    <%= account.getBankName() %> - <%= account.getAccountNumber() %> (Balance: <%= account.getBalance() %>)
                </option>
            <%
                    }
                }
            %>
        </select>

    <input type="text" class="input" name="ifsc" placeholder="Enter Ifsc Code" required>
         
        <input type="number" class="input" name="receiverAccount" pattern="[0-9]{12}" placeholder="Enter 12-digit  Account number" required>

        <input type="number" class="input" name="amount" step="0.01" min="100" placeholder="Enter amount" required>

      <input type="password" class="input" name="pin" pattern="\d{4}" title="Enter a 4-digit PIN" required>
      
        <button class="transfer-button" type="submit">Send Money</button>
    </form>

</div>
</body>
</html>
