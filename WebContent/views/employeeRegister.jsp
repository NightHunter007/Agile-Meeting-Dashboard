<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,800" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Registration</title>
<style>
body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
	background-image: url("${pageContext.request.contextPath}/img/cover.jpg");
	height: 100%; 
	overflow: hidden

}
</style>
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-in-container">
		<form action="<%=request.getContextPath() %>/register" method="post">
		<h1>Registration</h1>
		<input type="text" name="userName" placeholder="User Name" required/>
		<input type="email" name="email" placeholder="Email" required/>
		<input type="password" name="password" placeholder="Password" required/>
		<select name="role" class="dropdown"required>
		<option value="" disabled selected>Select Current Role</option>
  		<option value="BUSINESS ANALYST">Business Analyst</option>
  		<option value="FRONT END DEVELOPER">Front End Developer</option>
  		<option value="BACK END DEVELOPER">Back End Developer</option>
  		<option value="PRODUCT MANAGER">Product Manager</option>
		</select>
		<button type="submit">Create Account</button>
		<p>${message}</p>
		</form>
		
	</div>
	<div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-right">
          <h1>Hello, Friend!</h1>
          <p>Already have an account? Login here</p>
          <a href="<%= request.getContextPath() %>/login">Login</a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>