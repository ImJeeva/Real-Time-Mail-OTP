<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify OTP</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f8fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .verify-otp-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            padding: 30px;
        }
        
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-size: 14px;
            font-weight: 500;
        }
        
        input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 15px;
            transition: border-color 0.3s;
        }
        
        input:focus {
            outline: none;
            border-color: #4a90e2;
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
        }
        
        button {
            background-color: #4a90e2;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px;
            font-size: 16px;
            font-weight: 500;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }
        
        button:hover {
            background-color: #3a7bc8;
        }
        
        .auth-links {
            text-align: center;
            margin-top: 20px;
        }
        
        .auth-links a {
            color: #4a90e2;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }
        
        .auth-links a:hover {
            color: #3a7bc8;
            text-decoration: underline;
        }
        
        .message {
            margin-top: 20px;
            padding: 12px;
            border-radius: 5px;
            text-align: center;
            font-size: 14px;
            font-weight: 500;
        }
        
        .error {
            color: #842029;
            background-color: #f8d7da;
            border: 1px solid #f5c2c7;
        }
    </style>
</head>
<body>
    <div class="verify-otp-container">
        <h2>Verify OTP</h2>
        
        <form action="verify-otp" method="POST">
            <input type="hidden" name="email" value="${email}" />
            
            <div class="form-group">
                <label for="otp">Enter OTP:</label>
                <input type="text" id="otp" name="otp" required>
            </div>
            
            <button type="submit">Verify OTP</button>
        </form>
        
        <div class="auth-links">
            <a href="forgot-password.jsp">Resend OTP</a>
        </div>
        
        <c:if test="${not empty error}">
            <div class="message error">
                ${error}
            </div>
        </c:if>
    </div>
</body>
</html>