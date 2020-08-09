<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
    
    <link href="${pageContext.request.contextPath}/css/bootstrapMin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/basicDashboard.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>

<body style="overflow: hidden;" class="example">
    <div class="wrapper">
        <div class="sidebar" data-image="${pageContext.request.contextPath}/img/sidebar-5.jpg">
        
            <div class="sidebar-wrapper" style="background-color: black;
    background-image: url('${pageContext.request.contextPath}/img/content.jpg');
    background-repeat: no-repeat;
    background-position: 50% 80%;">
                <div class="logo" style="border: 0.5px groove wheat;">
                    <a href="javascript:;" class="simple-text">
                        Welcome
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath() %>/EmployeeController?action=REDIRECT">
                            <i class="nc-icon nc-icon nc-paper-2"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    
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
            <button type="button" class="btn-2 btn-dark" style="padding-left: 25px;padding-right: 25px;margin-top: 350px;">Log out</button>
            </a>

                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
      <nav class="navbar navbar-expand-lg  " style="background-color: black;
    background-image: url('${pageContext.request.contextPath}/img/maincontent.png');
    background-repeat: no-repeat;
    background-position: 50% 20%; min-height:70px">
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
      
      <h1 class="font-weight-bold" style="background-color:#333131; margin-top:0px;margin-bottom:0px;color:#ffffff;padding-left:450px;padding-top:40px;">Current Assigned Task</h1>
      <h2 style="background-color:#333131; margin-top:0px;margin-bottom:0px;color:#ffffff;padding-left:450px;padding-top:40px;">${currentTask}</h2>
            <div class="content">
                <div class="container-fluid">
                    <div class="progress" style="width: 800px;margin-left: 200px;margin-top: 20px;" >
        <div class="progress-bar progress-bar-danger progress-bar-striped" id="progressbar" aria-valuenow="10"
          id="progress" aria-valuemin="0" aria-valuemax="10" style="width:20%">
          10% Complete (started)
        </div>
      </div>
      <button onclick="handleClick()" class="btn btn-success" id="taskbtn" style="display: list-item;margin-left: 450px;margin-top: 30px;">Requirements fetched
        (30%)</button>
                </div>
            </div>
            
            <footer class="footer" style="border: none; height: 65px;">
                <div class="container-fluid">
                    <nav>
                        
                        <p class="copyright text-center">
                           Cibi
                            ©
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/progress.js"></script>
</body>


