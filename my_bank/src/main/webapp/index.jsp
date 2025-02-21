<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bank Home</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #ffffff;
	color: #333;
}

header {
	background: #3a8dde;
	color: white;
	padding: 20px;
	text-align: center;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 50px;
}

.logo {
	font-size: 28px;
	font-weight: bold;
}

.nav-links {
	display: flex;
	gap: 20px;
}

.btn {
	background: #3a8dde;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
	transition: 0.3s;
	font-size: 16px;
}

.btn:hover {
	background: #2f75b5;
}

main {
	width: 35%;
	height: 4%;
	padding: 80px 20px;
	box-shadow: 0 0 10px rgba(112, 178, 236, 0.8);
	border-radius: 50px;
	backdrop-filter: blur(10px);
	text-align: center;
	margin-left: 30%;
	margin-top: 2%;
}

.hero h1 {
	font-size: 36px;
	margin-bottom: 10px;
}

.hero p {
	font-size: 18px;
	color: #555;
}

footer {
	background: #3a8dde;
	color: white;
	padding: 15px;
	text-align: center;
	position: relative;
	bottom: 0;
	width: 100%;
	margin-top: 5%;
}
</style>
</head>
<body>
	<header>
		<nav>
			<div class="logo">MyBank</div>
			<div class="nav-links">
				<a href="signup.jsp" class="btn">Sign Up</a> <a href="login.jsp"
					class="btn">Sign In</a>
			</div>
		</nav>
	</header>

	<main>
		<section class="hero">
			<h1>Welcome to MyBank</h1>
			<p>Your secure banking partner</p>
			<a href="login.jsp" class="btn">Get Started</a>
		</section>
	</main>

	<footer>
		<p>&copy; 2025 MyBank. All rights reserved.</p>
	</footer>
</body>
</html>
