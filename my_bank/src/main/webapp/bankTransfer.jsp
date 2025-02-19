<%@page import="com.ty.dto.BankAccount"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<% String status=(String)request.getAttribute("status");
if(status!=null){
%>

<p><%=status %></p>

<%}
   String email=(String)session.getAttribute("loginEmail");
    List<BankAccount> bankAccounts =new BankAccountDao ().fetchBankByEmail(email) ;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Send Money to Bank Account</title>
    <style>
        body { font-family: Arial, sans-serif; }
        form { width: 300px; margin: 50px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px; }
        input, select, button { margin-bottom: 12px; padding: 8px; width: 100%; }
    </style>
</head>
<body>

    <h2 style="text-align:center;">Send Money to Bank Account</h2>

    <form action="bankTransfer" method="post">
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

          <label for="ifsc">IFSC Code:</label>
    <input type="text" id="ifsc" name="ifsc" required>
         
        <label for="account">Recipient Account Number:</label>
        <input type="number" id="account" name="receiverAccount" pattern="[0-9]{12}" placeholder="Enter 12-digit  Account number" required>

        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" min="1" placeholder="Enter amount" required>

  <label for="pin">Enter PIN:</label>
      <input type="password" id="pin" name="pin" pattern="\d{4}" title="Enter a 4-digit PIN" required>
      
        <button type="submit">Send Money</button>
    </form>

</body>
</html>
