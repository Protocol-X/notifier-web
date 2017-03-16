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
        
        <title>Eyes :: Home</title>
		
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <script src="./js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="./css/eyes-custom.css" 	 						media="all" type="text/css">  
        <script src="./js/lumino.glyphs.js"></script>
        <script src="./charts/Chart.js"></script>
</head>

<body>
	<jsp:directive.include file="./admin-menu.jsp" />
	<!---Start :: Actual Content ---->
		<div class="container main-container">

			<div id="cent-msg alertsform">
			 <h2>Configure an alert</h2>
			  <hr />
			 An email will be triggered to the configured email when the specified application fails.
			 <hr />
			  <form class="form-horizontal" action="alertsview" method="post">
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="appname">Application Name</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" name="appname" placeholder="Enter Application Name" required autofocus>
			      </div>
			    </div>
				<div class="form-group">
			      <label class="control-label col-sm-2" for="appuser"> Application User</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" name="appuser" placeholder="Enter Application User" required>
			      </div>
			    </div>    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="alertemail"> Email</label>
			      <div class="col-sm-10">
			        <input type="email" class="form-control" name="alertemail" placeholder="Enter Email" data-error="Bruh, that email address is invalid" required>
			      </div>
			    </div>
			    <div class="form-group">
			      <div class="col-sm-offset-2 col-sm-10">
			        <input type="submit" value="Add" name="action" class="btn btn-primary btn-block"/>
			      </div>
			    </div>
			  </form>
			</div>
 <hr />
</div>

	<!---End :: Actual Content ---->
	<jsp:directive.include file="./about.jsp" />   
</body>
</html>