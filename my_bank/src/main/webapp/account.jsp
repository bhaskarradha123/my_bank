<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bank Account Form</title>

</head>
<body>


<% String msg=(String)request.getAttribute("msg"); if(msg!=null){ %>

<p><%=msg %></p>
<%} %>
<h2 style="text-align:center;">Bank Account Form</h2>

<form method="post" action="createAccount" onsubmit="return validateForm()">
  
 

   
    <label for="accountNumber">Account Number:</label>
    <input type="number" id="accountNumber" name="accountNumber" required>

    <label for="aadharNum">Aadhar Number (12 digits):</label>
    <input type="number" id="aadharNum" name="aadharNum" pattern="\d{12}" title="Aadhar number must be exactly 12 digits" required>

    <label for="ifsc">IFSC Code:</label>
    <input type="text" id="ifsc" name="ifsc" required>

    <label for="accountType">Account Type:</label>
    <select id="accountType" name="accountType" required>
        <option value="Savings">Savings</option>
        <option value="Current">Current</option>
    </select>

       <label for="pin">PIN (4 digits):</label>
    <input type="password" id="pin" name="pin" pattern="\d{4}" title="PIN must be exactly 4 digits" required>

    <label for="confirmPin">Confirm PIN:</label>
    <input type="password" id="confirmPin" name="confirmPin" pattern="\d{4}" title="PIN must be exactly 4 digits" required>
    <div id="pinError" class="error"></div>
    <input type="submit" value="Submit">
</form>

</body>
</html>
