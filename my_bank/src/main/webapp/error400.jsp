<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>400 - Bad Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #fff5f5;
            overflow: hidden;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            color: #ff6347;
            font-size: 80px;
            margin-bottom: 20px;
            animation: bounce 1s infinite alternate;
        }

        @keyframes bounce {
            from { transform: translateY(0); }
            to { transform: translateY(-15px); }
        }

        p {
            font-size: 20px;
            color: #444;
            margin-bottom: 30px;
        }

        .countdown {
            font-size: 18px;
            font-weight: bold;
            color: #d9534f;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            background-color: #dc3545;
            border-radius: 25px;
            box-shadow: 0 0 20px #dc3545;
            transition: all 0.3s ease-in-out;
            animation: pulse 1.5s infinite;
        }

        a:hover {
            background-color: #c82333;
            box-shadow: 0 0 30px #ff4757;
            transform: scale(1.1);
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 10px #dc3545; }
            50% { box-shadow: 0 0 20px #ff4757; }
            100% { box-shadow: 0 0 10px #dc3545; }
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
    <h1>400</h1>
    <p>Oops! The server couldn't understand your request.</p>
    <div class="countdown">Redirecting to home in <span id="countdown">10</span> seconds...</div>
    <a href="index.jsp">Back to Home</a>
</body>
</html>
