<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Submitted</title>
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f5f5f5; /* Light gray background */
}

/* Container */
.container {
    text-align: center;
}

/* Message Box */
.message-box {
    background-color: #ffffff; /* White background */
    border: 1px solid #4caf50; /* Green border */
    border-radius: 10px;
    padding: 40px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

/* Heading */
.message-box h1 {
    color: #4caf50; /* Green text */
    margin-bottom: 20px;
}

/* Paragraph */
.message-box p {
    color: #555; /* Dark gray text */
    margin-bottom: 30px;
}

/* Button */
a {
    padding: 12px 20px;
    background-color: #4caf50; /* Green button */
    color: #ffffff;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s;
}
a:hover {
    background-color: #388e3c; /* Darker green on hover */
}

/* Responsive Styling */
@media (max-width: 500px) {
    .message-box {
        padding: 20px;
    }
}
    </style>
</head>
<body>
    <div class="container">
        <div class="message-box">
            <h1>Registration Successful!</h1>
            <p>Thank you for your registration.</p>
            <a href="login.jsp">Go To Login</a>
        </div>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>