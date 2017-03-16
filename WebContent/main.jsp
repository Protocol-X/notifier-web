<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
//allow access only if session exists
if(session.getAttribute("eyes-logged-username") == null){
	response.sendRedirect("login.jsp");
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        
        <title>Eyes :: Dashboard</title>
		
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <script src="./js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="./css/eyes-custom.css" 	 						media="all" type="text/css">  
        <script src="./js/lumino.glyphs.js"></script>
        <script src="./charts/Chart.js"></script>
    </head><body>
        
    </head><body>

<jsp:directive.include file="./admin-menu.jsp" />


<!---Start :: Actual Content ---->
<div class="container main-container">
<div id="score"><jsp:directive.include file="./widgetOne.jsp" /></div>
<!-- script type="text/javascript" src="./js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#score').load('apps_24.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds
</script>
-->
<img src="./images/health.png" />

		<div class="row">
        
		   <div class="col-sm-4">
				<div class="panel pborder">
					<div class="panel-heading  panel-hcheck">HDFS Health</div>
					<div class="panel-body">					
						<div class="row">
							<div class="col-sm-3 col-lg-3">
								<span class="glyphicon glyphicon-thumbs-down hidden-sm hidden-xs icon"></span>					
							</div>
							<div class="col-sm-9 col-lg-9">
								<div class="large">0 Issues</div>
								<div class="text-muted">All is well..!</div>
							</div>
						</div>					
					</div>
			`	</div>					
		   </div>
		   
		   <div class="col-sm-4">
				<div class="panel pborder">
					<div class="panel-heading  panel-hcheck">Hive Health</div>
					<div class="panel-body">					
						<div class="row">
							<div class="col-sm-3 col-lg-3">
								<span class="glyphicon glyphicon-thumbs-up hidden-sm hidden-xs icon"></span>					
							</div>
							<div class="col-sm-9 col-lg-9">
								<div class="large">0 Issues</div>
								<div class="text-muted">All is well..!</div>
							</div>
						</div>					
					</div>
			`	</div>					
		   </div>
		   		
		   <div class="col-sm-4">
				<div class="panel pborder">
					<div class="panel-heading  panel-hcheck">HBase Health</div>
					<div class="panel-body">					
						<div class="row">
							<div class="col-sm-3 col-lg-3">
								<span class="glyphicon glyphicon-thumbs-down hidden-sm hidden-xs icon"></span>					
							</div>
							<div class="col-sm-9 col-lg-9">
								<div class="large">0 Issues</div>
								<div class="text-muted">All is well..!</div>
							</div>
						</div>					
					</div>
			`	</div>					
		   </div>
				
    </div>
    <div class="row">
	<div class="col-md-1"></div>
        <div class="col-md-10">

		</div>
        <div class="col-md-2"></div>
    </div>
	    </div>		
            <!---End :: Actual Content ---->
<jsp:directive.include file="./about.jsp" />    
</body></html>