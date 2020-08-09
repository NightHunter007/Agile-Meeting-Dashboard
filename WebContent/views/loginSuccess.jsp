<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
 
<!DOCTYPE html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
  <title>
    Admin Portal
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet" type="text/css">
  
  
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="${pageContext.request.contextPath}/img/sidebar-1.jpg">
      <div class="logo"><a class="simple-text logo-normal">
          Admin Dashboard
        </a></div>
      <div class="sidebar-wrapper" style="background-color: black;
    background-image: url('${pageContext.request.contextPath}/img/maincontent.jpg');
    background-repeat: no-repeat;
    background-position: 50% 80%;">
        <ul class="nav">
          <li class="nav-item active  ">
            <a class="nav-link" href="<%=request.getContextPath() %>/EmployeeController?action=LIST">
              <i class="material-icons">dashboard</i>
              <p>Manage Users</p>
            </a>
          </li>
          
          <li class="nav-item ">
            <a class="nav-link" href="<%=request.getContextPath() %>/AssignController?action=REDIRECT">
              <i class="material-icons">content_paste</i>
              <p>Assign Jobs</p>
            </a>
          </li>
          
          
          <li class="nav-item active-pro ">
            <a href="<%=request.getContextPath() %>/AssignController?action=LOGOUT" style="
    margin-left: 75px;
    padding-bottom: 0px;
    padding-top: 0px;
    padding-right: 0px;
    padding-left: 0px;
    margin-right: 0px;
    margin-top: 0px;
    left: 75px;
    height: 25px;
    width: 105px;
    bottom: 0px;"
            >
            <button type="button" class="btn-2 btn-dark" style="padding-left: 25px; padding-right: 25px;">Log out</button>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg  " style="background-color: black;min-height:70px">
        <div class="container-fluid">
          
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            
            <ul class="navbar-nav">
      
            </ul>
          </div>
        </div> 
      </nav>
      <!-- End Navbar -->
    <div id="properties">
      <div id="users">
          <form action="<%=request.getContextPath() %>/EmployeeController?action=LIST" method="GET">
            <button  type="submit"  class="btn2 pos">Retrieve Employees</button> 
          </form>
        <h3 style="margin-left: 15%;"class="font-weight-bold">Recently Registered Users</h3>
        <table>
          <tr style="background-color: #FF4B2B;">
            <th>Id</th>
            <th>User Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Action</th>
          </tr>
          <c:forEach items="${list}" var="employee">
          	<tr>
          		<td>${employee.id}</td>
          		<td>${employee.userName}</td>
          		<td>${employee.email}</td>
          		<td>${employee.role}</td>
          		<td>
          		<a href="${pageContext.request.contextPath}/EmployeeController?action=EDIT&id=${employee.id}">Edit</a>
          		|
          		<a href="${pageContext.request.contextPath}/EmployeeController?action=DELETE&id=${employee.id}">Delete</a>
          		</td>
          	</tr>
          </c:forEach>
          </table>
          <h4 style="margin-left:500px;color:#008000;">${message}</h4>
      </div>
      <br><br>

      <form action="${pageContext.request.contextPath}/EmployeeController" method="POST">
        <h3 style="margin-right:30%;">Add Employee</h3>
        <input type="text" name="userName" placeholder="User Name" value="${employee.userName}" style="margin-bottom: 5px;margin-top: 5px;" required/>
		<input type="email" name="email" placeholder="Email" value="${employee.email}" style="margin-bottom: 5px;margin-top: 5px;" required/>
		<input type="password" name="password" placeholder="Password" style="margin-bottom: 5px;margin-top: 5px;" required/>
		<select name="role" style="
    width: 285px;
    height: 42px;
    padding-top: 9px;
    margin-top: 8px;
    margin-bottom: 8px;
    padding-left: 15px;
    padding-right: 15px;
    padding-bottom: 9px;
    " required>
  		<option value="" disabled selected>Select Current Role</option>
  		<option value="BUSINESS ANALYST">Business Analyst</option>
  		<option value="FRONT END DEVELOPER">Front End Developer</option>
  		<option value="BACK END DEVELOPER">Back End Developer</option>
  		<option value="PRODUCT MANAGER">Product Manager</option>
		</select>
		
        <input type="hidden" value="${employee.id}" name="id"/>
        <button  type="submit" class="btn" >Save Employee</button> 
      </form>

    </div>
    


</body>
