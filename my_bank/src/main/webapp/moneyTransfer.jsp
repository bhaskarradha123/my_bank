<!-- Money Transfer Selection Page with CSS -->
<html>
<head>
  <title>Money Transfer Options</title>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #eef7ff;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 0;
    }
    .container {
      background-color: #ffffff;
      padding: 40px;
      border-radius: 20px;
      border: 2px solid #007acc;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      text-align: center;
      width: 350px;
    }
    h2 {
      color: #0056b3;
      font-weight: 700;
      margin-bottom: 20px;
    }
    .option-btn {
      background-color: #007acc;
      color: white;
      font-size: 1rem;
      padding: 12px;
      margin: 10px 0;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
      width: 100%;
    }
    .option-btn:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Select Transfer Type</h2>
    <form method="get">
      <button class="option-btn" formaction="selfTransfer.jsp">Self Transfer</button>
      <button class="option-btn" formaction="bankTransfer.jsp">To Bank Account</button>
      <button class="option-btn" formaction="phoneTransfer.jsp">To Phone Number </button>
    </form>
  </div>
</body>
</html>
