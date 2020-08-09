<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,800" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Login</title>
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
		<form action="<%=request.getContextPath() %>/login" method="post">
		<h1>Employee Login</h1>
		<input type="text" id="userName" name="userName" placeholder="User Name" required/>
        <input type="password" id="password" name="password" placeholder="Password" required/>
		<button type="submit">Login</button>
		</form>
	</div>
	<div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-right">
          <h1>Hello, Friend!</h1>
          <p>Enter your personal details and start your journey with us.</p>
          <a href="<%= request.getContextPath() %>/register">Register</a>
        </div>
      </div>
    </div>
</div>
</body>
</html>