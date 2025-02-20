<%@page import="com.ty.dto.BankAccount"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Check Balance</title>
<style>
  body {
    font-family: 'Poppins', sans-serif;
    background-color: #e0f7fa;
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .container {
    text-align: center;
    background-color: #ffffff;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s;
  }
  .container:hover {
    transform: translateY(-5px);
  }
  h2, p, label {
    font-weight: 600;
  }
  input[type="submit"] {
    font-family: inherit;
    background-color: #00796b;
    color: white;
    border: none;
    padding: 14px 28px;
    border-radius: 8px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  input[type="submit"]:hover {
    background-color: #004d40;
  }
  p#wrongPin {
    color: #d32f2f;
    font-weight: bold;
    font-size: 1.1rem;
    animation: bounce 0.6s ease infinite alternate;
  }
  @keyframes bounce {
    from { transform: translateY(0); }
    to { transform: translateY(-5px); }
  }
</style>
</head>
<body>
  <div class="container">
    <% String pinMsg = (String) request.getAttribute("balanceMsg");
       if (pinMsg != null) { %>
    <p>Your current balance is:</p>
    <h3><%=pinMsg%></h3>
    <% } %>

    <% String wrongPin = (String) request.getAttribute("wrongPin");
       if (wrongPin != null) { %>
    <p id="wrongPin">Wrong PIN. Please try again.</p>
    <% } %>

    <h2>Check Account Balance</h2>
    <% String email = (String) session.getAttribute("loginEmail");
       List<BankAccount> list = new BankAccountDao().fetchBankByEmail(email);
       if (list.size() > 0) { %>
    
    <form method="post" action="checkBalance">
      <label for="bankName">Select Bank Name:</label>
      <select id="bankName" name="bankName" required>
        <option value="">-- Select Bank --</option>
        <% for (BankAccount a : list) { %>
        <option value="<%=a.getBankName()%>:<%=a.getAccountNumber()%>">
          <%=a.getBankName()%>
        </option>
        <% } %>
      </select>
      <label for="pin">Enter PIN:</label>
      <input type="password" id="pin" name="pin" pattern="\d{4}" title="Enter a 4-digit PIN" required>
      <input type="submit" value="Check Balance">
    </form>
    <% } else {
         request.setAttribute("msg", "You don't have an account to check balance. Please add an account first.");
         request.getRequestDispatcher("account.jsp").forward(request, response);
       } %>
  </div>
      <a href="dashboard.jsp"><button>DASHBOARD</button></a>
  
</body>
</html>
