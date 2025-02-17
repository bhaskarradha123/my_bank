<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>405 - Method Not Allowed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #f0f8ff;
            overflow: hidden;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            color: #ffa500;
            font-size: 80px;
            margin-bottom: 20px;
            animation: shake 0.5s ease-in-out infinite alternate;
        }

        @keyframes shake {
            from { transform: rotate(-2deg); }
            to { transform: rotate(2deg); }
        }

        p {
            font-size: 20px;
            color: #444;
            margin-bottom: 30px;
        }

        .countdown {
            font-size: 18px;
            font-weight: bold;
            color: #007acc;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            background-color: #28a745;
            border-radius: 25px;
            box-shadow: 0 0 20px #28a745;
            transition: all 0.3s ease-in-out;
            animation: pulse 1.5s infinite;
        }

        a:hover {
            background-color: #218838;
            box-shadow: 0 0 30px #32cd32;
            transform: scale(1.1);
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 10px #28a745; }
            50% { box-shadow: 0 0 20px #32cd32; }
            100% { box-shadow: 0 0 10px #28a745; }
        }
    </style>
    <script>
        let countdown = 10;
        function startCountdown() {
            const countdownElement = document.getElementById('countdown');
            const interval = setInterval(() => {
                countdown--;
                countdownElement.textContent = countdown;
                if (countdown <= 0) {
                    clearInterval(interval);
                    window.location.href = 'index.jsp'; // Redirect after countdown
                }
            }, 1000);
        }

        window.onload = startCountdown;
    </script>
</head>
<body>
    <h1>405</h1>
    <p>Oops! The request method is not supported for this resource.</p>
    <div class="countdown">Redirecting to home in <span id="countdown">10</span> seconds...</div>
    <a href="index.jsp">Back to Home</a>
</body>
</html>
