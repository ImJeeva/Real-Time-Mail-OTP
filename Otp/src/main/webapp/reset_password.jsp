<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
      background-color: #f5f7fa;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }
    
    .container {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      padding: 40px;
      width: 100%;
      max-width: 450px;
    }
    
    h2 {
      color: #333;
      margin-bottom: 24px;
      text-align: center;
      font-weight: 600;
    }
    
    .form-group {
      margin-bottom: 24px;
    }
    
    label {
      display: block;
      margin-bottom: 6px;
      color: #555;
      font-weight: 500;
      font-size: 14px;
    }
    
    input[type="password"] {
      width: 100%;
      padding: 12px 16px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 16px;
      transition: border 0.3s ease;
    }
    
    input[type="password"]:focus {
      border-color: #4a90e2;
      outline: none;
      box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
    }
    
    button {
      background-color: #4a90e2;
      color: white;
      border: none;
      border-radius: 4px;
      padding: 12px 24px;
      font-size: 16px;
      cursor: pointer;
      width: 100%;
      transition: background-color 0.3s ease;
    }
    
    button:hover {
      background-color: #3a7bc8;
    }
    
    .message {
      margin-top: 20px;
      padding: 12px;
      border-radius: 4px;
      text-align: center;
      font-size: 14px;
    }
    
    .success {
      background-color: rgba(39, 174, 96, 0.1);
      color: #27ae60;
      border: 1px solid rgba(39, 174, 96, 0.2);
    }
    
    .logo {
      text-align: center;
      margin-bottom: 30px;
    }
    
    .logo img {
      height: 40px;
    }
    
    .password-requirements {
      font-size: 12px;
      color: #777;
      margin-top: 6px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="logo">
      <img src="/api/placeholder/180/40" alt="Company Logo" />
    </div>
    
    <h2>Reset Your Password</h2>
    
    <form action="reset-password" method="POST">
      <input type="hidden" name="email" value="${email}" />
      
      <div class="form-group">
        <label for="newPassword">New Password</label>
        <input 
          type="password" 
          id="newPassword" 
          name="newPassword" 
          required 
          placeholder="Enter your new password"
          autocomplete="new-password"
        />
        <p class="password-requirements">
          Password must be at least 8 characters and include uppercase, lowercase, number, and special character
        </p>
      </div>
      
      <div class="form-group">
        <label for="confirmPassword">Confirm Password</label>
        <input 
          type="password" 
          id="confirmPassword" 
          name="confirmPassword" 
          required 
          placeholder="Confirm your new password"
          autocomplete="new-password"
        />
      </div>
      
      <button type="submit">Reset Password</button>
    </form>
    
    <c:if test="${not empty msg}">
      <div class="message success">${msg}</div>
    </c:if>
  </div>
  
  <script>
    const newPassword = document.getElementById('newPassword');
    const confirmPassword = document.getElementById('confirmPassword');
    const form = document.querySelector('form');
    
    form.addEventListener('submit', function(event) {
      if (newPassword.value !== confirmPassword.value) {
        event.preventDefault();
        alert('Passwords do not match!');
      }
    });
  </script>
</body>
</html>