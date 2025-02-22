<!DOCTYPE html>
<html>
<head>
<title>Bank Account Form</title>

<style>
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

@keyframes fadeIn {
	from { opacity:0; }
	to { opacity: 1; }
}

.container {
	background: #f8f9fa;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(25, 3, 150, 0.5);
	width: 500px;
	
	text-align: center;
	transform: scale(0.9);
	animation: popUp 0.5s ease-in-out forwards;
}

@keyframes popUp {
	from { transform:scale(0.9); opacity: 0; }
	to { transform: scale(1); opacity: 1; }
}

.heading {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #3a8dde;
	animation: slideIn 0.7s ease-in-out;
}

@keyframes slideIn {
	from { transform:translateY(-20px); opacity: 0; }
	to { transform: translateY(0); opacity: 1; }
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

label {
	display: block;
	text-align: left;
	font-weight: bold;
	margin-top: 10px;
}

.input {
	width: 70%;
	padding: 10px;
	margin-top: 5px;
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

.create-button {
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
.form-group {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 10px;
}

label {
	width: 30%;
	text-align: left;
	font-weight: bold;
}



.create-button:hover {
	background: #2f75b5;
	transform: scale(1.05);
	box-shadow: 0 5px 15px rgba(58, 141, 222, 0.4);
}
</style>
</head>
<body>

	<a href="dashboard.jsp" class="dashboard-button">DASHBOARD</a>

	<div class="container">

		<%
		String msg = (String) request.getAttribute("msg");
		if (msg != null) {
		%>
		<p class="msg"><%=msg%></p>
		<%
		}
		%>

		<div class="heading">Bank Account Form</div>

		<form method="post" action="createAccount" class="form">
		    <div class="form-group">
			<label for="accountNumber">Account Number:</label>
			<input type="number" class="input" id="accountNumber" name="accountNumber" placeholder="Enter Account Number" required>
            </div>
            <div class="form-group">
 
			<label for="accountType">Account Type:</label>
			<select id="accountType" class="input" name="accountType" required>
				<option value="Savings">Savings</option>
				<option value="Current">Current</option>
			</select> 
            </div>
            <div class="form-group"> 
			<label for="ifsc">IFSC Code:</label>
			<input type="text" class="input" id="ifsc" name="ifsc" placeholder="Enter IFSC Code" required onblur="fetchBankDetails()">
            </div>
            
            <div class="form-group">
            
			<label for="bankName">Bank Name:</label>
			<input type="text" class="input" id="bankName" name="bankName" placeholder="Bank Name" readonly>
           </div>
            <div class="form-group">
			<label for="branch">Branch:</label>
			<input type="text" class="input" id="branch" name="branch" placeholder="Branch" readonly>
            </div>
            <div class="form-group">
			<label for="city">City:</label>
			<input type="text" class="input" id="city" name="city" placeholder="City" readonly>
            </div>
            <div class="form-group">
			<label for="state">State:</label>
			<input type="text" class="input" id="state" name="state" placeholder="State" readonly>
            </div>
            <div class="form-group">
			<label for="pin">New PIN:</label>
			<input type="password" class="input" id="pin" name="pin" placeholder="Enter New PIN" pattern="\d{4}" title="PIN must be exactly 4 digits" required>
            </div>
            <div class="form-group">

			<label for="confirmPin">Confirm PIN:</label>
			<input type="password" class="input" id="confirmPin" name="confirmPin" placeholder="Confirm PIN" pattern="\d{4}" title="PIN must be exactly 4 digits" required>
            </div>
			<input type="submit" class="create-button" value="Submit">
		</form>

	</div>

<script>
function fetchBankDetails() {
    var ifsc = document.getElementById("ifsc").value;
    
    if(ifsc.length === 11) { 
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "FetchBankDetailsServlet?ifsc=" + ifsc, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                
                if(response.error) {
                    alert("Invalid IFSC Code");
                } else {
                    document.getElementById("bankName").value = response.BANK;
                    document.getElementById("branch").value = response.BRANCH;
                    document.getElementById("city").value = response.CITY;
                    document.getElementById("state").value = response.STATE;
                }
            }
        };
        xhr.send();
    }
}
</script>

</body>
</html>
