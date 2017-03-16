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
		</div>
	<!---End :: Actual Content ---->
	<jsp:directive.include file="./about.jsp" />   
</body>
</html>