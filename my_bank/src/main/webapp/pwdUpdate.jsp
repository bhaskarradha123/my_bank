<%@page import="com.ty.dto.User"%>
<%@page import="com.ty.dao.UserDao"%>
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
String email=(String)session.getAttribute("loginEmail");
UserDao dao = new UserDao();

User data = dao.fetchProfileByEmail(email);
if (email != null && data != null) {
%>
 <div class="form-container">
        <h2>Reset Your Password</h2>
        <form id="forgotPasswordForm" action="updatePwd" method="POST" onsubmit="return validateForm()">
          
                      <input type="email" id="email" name="email" value="<%=email %>" hidden="hidden">
          
            <label for="new_password">New Password</label>
            <input type="password" id="new_password" name="pwd" placeholder="Enter your new password" required>

            <label for="confirm_password">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm your new password" required>
            <span class="error-message" id="error-message"> </span>
            <input type="submit" value="Reset Password">
        </form>
        <div class="login-link">
            <p>Are you remembered your password? <a href="login_page.jsp">Login here</a></p>
        </div>
    </div>






 <script>
        function validateForm() {
            var newPassword = document.getElementById('new_password').value;
            var confirmPassword = document.getElementById('confirm_password').value;
            var errorMessage = document.getElementById('error-message');
            var passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[$@])[A-Za-z\d$@]{8,}$/;

            // Check if passwords match
            if (newPassword !== confirmPassword) {
                errorMessage.textContent = "Passwords do not match!";
                errorMessage.classList.add('active');
                return false;
            }

            // Check password complexity
            if (!passwordPattern.test(newPassword)) {
                errorMessage.textContent = "Password must be at least 8 characters long, contain at least one uppercase letter, one number, and special characters ($ or @) only.";
                errorMessage.classList.add('active');
                return false;
            }

            // Clear error message
            errorMessage.textContent = "";
            errorMessage.classList.remove('active');
            return true;
        }
    </script>

<%} %>



</body>
</html>