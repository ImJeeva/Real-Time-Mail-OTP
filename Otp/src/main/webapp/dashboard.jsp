<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.otp.Entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
      background-color: #f5f7fa;
      padding: 20px;
      color: #333;
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    header {
      background-color: #ffffff;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 30px;
      border-radius: 8px;
    }
    
    .profile-section {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    
    h1 {
      color: #333;
      margin-bottom: 20px;
    }
    
    h2 {
      color: #4a4a4a;
      margin-bottom: 15px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-info {
      display: flex;
      flex-wrap: wrap;
      gap: 30px;
    }
    
    .profile-avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      overflow: hidden;
      background-color: #e1e5e8;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 40px;
      color: #6c757d;
    }
    
    .profile-avatar img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    
    .profile-details {
      flex: 1;
    }
    
    .info-group {
      margin-bottom: 20px;
    }
    
    .info-label {
      font-weight: 600;
      font-size: 14px;
      color: #6c757d;
      margin-bottom: 5px;
    }
    
    .info-value {
      font-size: 16px;
    }
    
    .button {
      display: inline-block;
      background-color: #4a90e2;
      color: white;
      padding: 10px 15px;
      border-radius: 4px;
      text-decoration: none;
      font-weight: 500;
      margin-top: 15px;
      transition: background-color 0.3s;
    }
    
    .button:hover {
      background-color: #3a7bc8;
    }
    
    .error-message {
      background-color: #f8d7da;
      color: #721c24;
      padding: 15px;
      border-radius: 4px;
      margin: 20px 0;
    }
  </style>
</head>
<body>
  <div class="container">
    <header>
      <h1>User Profile</h1>
    </header>
    
    <div class="profile-section">
      <% 
        User user = (User) session.getAttribute("user");
        if (user != null) {
      %>
        <h2>Welcome, <%= user.getName() %></h2>
<%--         
        <div class="profile-info">
          <div class="profile-avatar">
            <% if (user.getProfileImage() != null) { %>
              <img src="<%= user.getProfileImage() %>" alt="Profile Image">
            <% } else { %>
              <%= user.getFirstName().charAt(0) %>
            <% } %>
          </div> --%>
          
      <%--     <div class="profile-details">
            <div class="info-group">
              <div class="info-label">Full Name</div>
              <div class="info-value"><%= user.getFirstName() %> <%= user.getLastName() %></div>
            </div>
            
            <div class="info-group">
              <div class="info-label">Email Address</div>
              <div class="info-value"><%= user.getEmail() %></div>
            </div>
            
            <div class="info-group">
              <div class="info-label">Account Created</div>
              <div class="info-value"><%= user.getCreatedAt() %></div>
            </div> --%>
            
            <a href="editProfile.jsp" class="button">Edit Profile</a>
            <a href="changePassword.jsp" class="button">Change Password</a>
          </div>
        </div>
      <% } else { %>
        <div class="error-message">
          <p>User information not found. Please <a href="login.jsp">login</a> to view your profile.</p>
        </div>
      <% } %>
    </div>
  </div>
</body>
</html>