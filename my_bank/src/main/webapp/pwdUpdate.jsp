<%@page import="com.ty.dto.User"%>
<%@page import="com.ty.dao.UserDao"%>
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
	height: 100vh;
	position: relative;
}


.links a {
	color: #3a8dde;
	text-decoration: none;
	transition: color 0.3s;
}

.links a:hover {
	color: #2f75b5;
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
	width: 400px;
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

.reset-button {
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

.reset-button:hover {
	background: #2f75b5;
}
</style>

</head>
<body>

<% 
String email=(String)session.getAttribute("loginEmail");
UserDao dao = new UserDao();

User data = dao.fetchProfileByEmail(email);
if (email != null && data != null) {
%>
	<a href="dashboard.jsp" class="dashboard-button">DASHBOARD</a>

 <div class="container">
			<div class="heading">RESET YOUR PASSWORD</div>
        <form  class="form" id="forgotPasswordForm" action="updatePwd" method="POST" onsubmit="return validateForm()">
          
                      <input type="email" id="email" name="email" value="<%=email %>" hidden="hidden">
          
            <input type="password" class="input" id="new_password" name="pwd" placeholder="Enter your new password" required>

            <input type="password" class="input" id="confirm_password" name="confirm_password" placeholder="Confirm your new password" required>
            <span class="msg" id="error-message"> </span>
            <input type="submit" class="reset-button" value="Reset Password">
        </form>
        <div class="links">
             <a href="login.jsp">Are you remembered your password?Login here</a>
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
