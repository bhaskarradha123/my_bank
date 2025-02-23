<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #ffffff;
	color: #333;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	animation: fadeIn 1.5s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.container {
	background: #f8f9fa;
	padding: 30px;
	border-radius: 10px;
    box-shadow: 0 0 15px rgba(25, 3, 150, 0.5);
	width: 400px;
	text-align: center;
	transform: scale(0.9);
	animation: popUp 0.5s ease-in-out forwards;
}

@
keyframes popUp {from { transform:scale(0.9);
	opacity: 0;
}

to {
	transform: scale(1);
	opacity: 1;
}

}
.heading {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #3a8dde;
	animation: slideIn 0.7s ease-in-out;
}

@
keyframes slideIn {from { transform:translateY(-20px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

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

.input {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	transition: all 0.3s ease-in-out;
	position: relative;
}

.input:focus {
	border-color: #3a8dde;
	box-shadow: 0 0 15px rgba(58, 141, 222, 0.5);
	transform: scale(1.02);
}

.login-button {
	background: #3a8dde;
	color: white;
	padding: 10px;
	border: none;
	width: 100%;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	transition: background 0.3s, transform 0.2s;
}

.login-button:hover {
	background: #2f75b5;
	transform: scale(1.05);
	box-shadow: 0 5px 15px rgba(58, 141, 222, 0.4);
}

.forgot-password a {
	color: #3a8dde;
	text-decoration: none;
	transition: color 0.3s;
}

.forgot-password a:hover {
	color: #2f75b5;
}
</style>
</head>
<body>
	<div class="container">
		<%
		String msg = (String) request.getAttribute("msg");
		if (msg != null) {
		%>
		<p class="msg" style="color: red;"><%=msg%></p>
		<%
		}
		%>
		<div class="heading">Sign Up</div>
		<form action="save" class="form" method="post"
			enctype="multipart/form-data">
			<input required="required" class="input" type="text" name="firstName"
				placeholder="First Name"> <input required="required"
				class="input" type="text" name="lastName" placeholder="Last Name">
			<select required="required" class="input" name="gender">
				<option value="">Select Gender</option>
				<option value="male">Male</option>
				<option value="female">Female</option>
				<option value="other">Other</option>
			</select> <input required="required" class="input" type="text" name="address"
				placeholder="Address"> <input required="required"
				class="input" type="number" name="age" placeholder="Age" min="1">
			<input required="required" class="input" type="tel" name="phone"
				placeholder="Phone Number" pattern="[0-9]{10}"
				title="Enter a 10-digit phone number"> <input
				required="required" class="input" type="file" name="ima"
				accept="image/*"> <input required="required" class="input"
				type="email" name="email" placeholder="E-mail"> <input
				required="required" class="input" type="password" name="password"
				placeholder="Password"> <span class="forgot-password"><a
				href="login.jsp">Already Registered?</a></span> <input class="login-button"
				type="submit" value="Sign Up">
		</form>
	</div>
	
	
	
</body>
</html>
