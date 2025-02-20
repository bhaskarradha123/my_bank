<%@page import="com.ty.dto.BankAccount"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>



<!DOCTYPE html>
<html>
<head>
    <title>Send Money to Phone Number</title>
    <style>
        body { font-family: Arial, sans-serif; }
        form { width: 300px; margin: 50px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px; }
        input, select, button { margin-bottom: 12px; padding: 8px; width: 100%; }
    </style>
</head>
<body>

<% String status=(String)request.getAttribute("status");
if(status!=null){
%>

<p><%=status %></p>

<%}
   String email=(String)session.getAttribute("loginEmail");
    List<BankAccount> bankAccounts =new BankAccountDao ().fetchBankByEmail(email) ;
%>

    <h2 style="text-align:center;">Send Money to Phone Number</h2>

    <form action="numberTransfer" method="post">
        <label for="account">Select Bank Account:</label>
        <select name="senderAccount" id="account" required>
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

        <label for="phone">Recipient Phone Number:</label>
        <input type="tel" id="phone" name="receiverPhone" pattern="[0-9]{10}" placeholder="Enter 10-digit phone number" required>

        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" min="100" placeholder="Enter amount" required>

  <label for="pin">Enter PIN:</label>
      <input type="password" id="pin" name="pin" pattern="\d{4}" title="Enter a 4-digit PIN" required>
      
        <button type="submit">Send Money</button>
    </form>



      <a href="dashboard.jsp"><button>DASHBOARD</button></a>

</body>
</html>
