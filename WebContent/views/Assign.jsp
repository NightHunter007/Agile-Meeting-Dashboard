<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet" type="text/css">
  
  
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" >
      <div class="logo"><a class="simple-text logo-normal">
          Admin Dashboard
        </a></div>
      <div class="sidebar-wrapper" style="background-color: black;
    background-image: url('${pageContext.request.contextPath}/img/content.jpg');
    background-repeat: no-repeat;
    background-position: 50% 80%;">
        <ul class="nav">
          <li class="nav-item   ">
            <a class="nav-link" href="<%=request.getContextPath() %>/EmployeeController?action=LIST">
              <i class="material-icons">dashboard</i>
              <p>Manage Users</p>
            </a>
          </li>
          
          <li class="nav-item active ">
            <a class="nav-link" href="<%=request.getContextPath() %>/AssignController?action=REDIRECT">
              <i class="material-icons">content_paste</i>
              <p>Assign Jobs</p>
            </a>
          </li>
          
          
          <li class="nav-item active-pro ">
            <a href="<%=request.getContextPath() %>/AssignController?action=LOGOUT" style="
    margin-left: 0px;
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
		<h4 style="margin-left:500px;color:#008000;">${message}</h4>
		<div class="container-fluid" style="position:absolute ;" >
                    <div class="progress" style="height:20px;width: 800px;margin-left: 420px;margin-top: 200px;">
        <div class="progress-bar progress-bar-danger progress-bar-striped" id="progressbar" aria-valuenow="10"
          id="progress" aria-valuemin="0" aria-valuemax="10" style="width:20%">
          10% Complete (started)
        </div>
      </div>
         </div>
         
         
         <div class="container-fluid" style="position:absolute ;" >
                    <div class="progress" style="height:20px;width: 800px;margin-left: 420px;margin-top: 640px;">
        <div class="progress-bar progress-bar-striped bg-danger" id="progressbar" aria-valuenow="10"
          id="progress" aria-valuemin="0" aria-valuemax="50" style="width:50%">
          Development Started (50%)
        </div>
      </div>
         </div>
         
         
         <div class="container-fluid" style="position:absolute ;" >
                    <div class="progress" style="height:20px;width: 800px;margin-left: 420px;margin-top: 1080px;">
        <div class="progress-bar progress-bar-striped bg-success" id="progressbar" aria-valuenow="10"
          id="progress" aria-valuemin="0" aria-valuemax="90" style="width:90%">
          Testing and Integration (90%)
        </div>
      </div>
         </div>
         
         
		<div id="newcontentcards"></div>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/assignJob.js"></script>
		
	</div>
	</div>
</body>
</html>