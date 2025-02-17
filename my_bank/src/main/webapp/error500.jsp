<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>500 - Internal Server Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #f0f8ff; /* Light pastel blue */
            color: #2c3e50;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            font-size: 100px;
            color: #ff6f61; /* Coral */
            margin-bottom: 20px;
            animation: wave 2s infinite alternate;
        }

        @keyframes wave {
            0% { transform: rotate(-5deg); }
            100% { transform: rotate(5deg); }
        }

        p {
            font-size: 22px;
            margin-bottom: 30px;
        }

        .countdown {
            font-size: 18px;
            font-weight: bold;
            color: #ffa502; /* Amber */
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            background-color: #6a89cc; /* Soft blue */
            border-radius: 25px;
            transition: transform 0.3s ease-in-out;
            animation: glow 2s infinite;
        }

        a:hover {
            transform: scale(1.1);
        }

        @keyframes glow {
            0% { box-shadow: 0 0 5px #6a89cc; }
            50% { box-shadow: 0 0 20px #82ccdd; }
            100% { box-shadow: 0 0 5px #6a89cc; }
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
                    window.location.href = 'index.jsp';
                }
            }, 1000);
        }
        window.onload = startCountdown;
    </script>
</head>
<body>
    <h1>500</h1>
    <p>Sorry! Something went wrong on our end. We're working on it.</p>
    <div class="countdown">Redirecting to home in <span id="countdown">10</span> seconds...</div>
    <a href="index.jsp">Back to Home</a>
</body>
</html>
