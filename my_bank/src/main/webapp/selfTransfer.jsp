<%@page import="com.ty.dto.BankAccount"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>



<!DOCTYPE html>
<html>
<head>
    <title>Send Money to Your Account</title>
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
    if(bankAccounts.size()>1){
%>


    <h2 style="text-align:center;">Send Money to Your Account</h2>

<form action="selfTransfer" method="post" >        
<label for="account">Select From  Bank Account:</label>
        <select name="senderAccount" id="account" required>
            <option value="">-- Choose  From Account --</option>
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

          <label for="account">Select To Bank Account:</label>
        <select name="recieverAccount" id="account" required>
            <option value="">-- Choose To Account --</option>
            <% 
                if (bankAccounts.size()>0) {
                    for (BankAccount account : bankAccounts) {
            %>
                <option value="<%= account.getAccountNumber() %>">
                    <%= account.getBankName() %> - <%= account.getAccountNumber() %> 
                </option>
            <%
                    }
                }
            %>
        </select>
        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" min="100" placeholder="Enter amount" required>

  <label for="pin">Enter PIN:</label>
      <input type="password" id="pin" name="pin" pattern="\d{4}" title="Enter a 4-digit PIN" required>
      
        <button type="submit">Send Money</button>
    </form>

<%}
    else{
    	request.setAttribute("msg", "you dont have multiple accounts to perform pls try to correct another account for self transfer");
    	request.getRequestDispatcher("account.jsp").forward(request, response);
    }
    %>
    
    
   
</body>
</html>
