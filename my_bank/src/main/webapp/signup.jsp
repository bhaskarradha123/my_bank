<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<link rel="stylesheet" href="css/signup.css">

</head>
<body>


	<div class="container">

		<%
		String msg = (String) request.getAttribute("msg");
		if (msg != null) {
		%>

		<p class="input" ><%=msg%></p>
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
				href="login.jsp">Already Register? SIGNIN</a></span> <input
				class="login-button" type="submit" value="Sign Up">
		</form>

	</div>
</body>
</html>