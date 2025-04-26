<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        
        .login-container {
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
            margin-top: 10px;
            margin-bottom: 20px;
        }
        
        button:hover {
            background-color: #3a7bc8;
        }
        
        .auth-links {
            text-align: center;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        
        .auth-links a {
            display: block;
            color: #4a90e2;
            text-decoration: none;
            padding: 8px 0;
            font-size: 14px;
            transition: color 0.3s;
        }
        
        .auth-links a:hover {
            color: #3a7bc8;
            text-decoration: underline;
        }
        
        .message {
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }
        
        .error {
            color: #d9534f;
            background-color: #fdf7f7;
            border: 1px solid #f5c6cb;
        }
        
        .success {
            color: #5cb85c;
            background-color: #f1f9f1;
            border: 1px solid #c3e6cb;
        }
        
        /* Hide empty message containers */
        .message:empty {
            display: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        
        <form action="login" method="POST">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit">Login</button>
        </form>
        
        <div class="auth-links">
            <a href="forgot_password.jsp">Forgot Password?</a>
            <a href="signup.jsp">Sign Up</a>
        </div>
        
        <%-- Only show error message if it exists --%>
        <c:if test="${not empty error}">
            <div class="message error">
                ${error}
            </div>
        </c:if>
        
        <%-- Only show success message if it exists --%>
        <c:if test="${not empty msg}">
            <div class="message success">
                ${msg}
            </div>
        </c:if>
    </div>
</body>
</html>