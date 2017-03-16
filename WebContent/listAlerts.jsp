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
        
        <title>Eyes :: Alerts List</title>
		
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <script src="./js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="./css/bootstrap-table.css" 	 					media="all" type="text/css">
        <link rel="stylesheet" href="./css/jquery.dataTables.min.css" 	 				media="all" type="text/css">
        <link rel="stylesheet" href="./css/dataTables.bootstrap.min.css" 	 			media="all" type="text/css">                 
		<link rel="stylesheet" href="./css/eyes-custom.css" 	 						media="all" type="text/css">
        <script src="./js/lumino.glyphs.js"></script>
        <script src="./charts/Chart.js"></script>
        <script src="./js/jquery-1.12.3.js"></script>
</head>

<body>
	<jsp:directive.include file="./admin-menu.jsp" />
	<!---Start :: Actual Content ---->
		<div class="container main-container">
		<div id="appdetails">	
		<!--  table-bordered for borders -->
			<table id="listapps" class="stripe table table-striped" cellspacing="0" >
		        <thead>
		            <tr>
						<th>id</th>
						<th>app_name</th>
						<th>email</th>
						<th>is_enabled</th>
						<th style="width:30px;">action</th>
		            </tr>
		        </thead>
		        <tbody>
		         <c:forEach items="${alerts}" var="alert">
		                <tr>
							<td><c:out value="${alert.id}" /></td>
							<td><c:out value="${alert.app_name}" /></td>
							<td><c:out value="${alert.email}" /></td>
							<td><c:out value="${alert.is_enabled}" /></td>
							<td><a href="alertsview?action=delete&id=<c:out value="${alert.id}" />"  onclick="return confirm('Are you sure to delete the alert configuration?')"> Delete</a></td>
		                </tr>
		            </c:forEach>
		        </tbody>
		        <tfoot>
		            <tr>
						<th>id</th>
						<th>app_name</th>
						<th>email</th>
						<th>is_enabled</th>
						<th>action</th>
		            </tr>
		        </tfoot>
	        </table>
	        </div>
		</div>
	  
			
		
		<script type="text/javascript" charset="utf8" src="./js/jquery-3.1.1.min.js"></script>
	 	<script type="text/javascript" charset="utf8" src="./js/jquery.dataTables.min.js"></script>
		<script src="./js/bootstrap.min.js"></script>
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title"><span><img src="./images/5.png" style='height: 150%; padding-right:20px;'/> Applications</span></h4>
                        </div>
                        <div class="modal-body">
                            <p>About the Application</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Script for About Display -->
            <script>
                $(document).ready(function(){
                    $("#myBtn").click(function(){
                        $("#myModal").modal("toggle");
                        
                    });
                    $('#listapps').DataTable({
                    	"order": [[ 0, "desc" ]],
                    	"pageLength": 15
                    });
                });
            </script>
	<!---End :: Actual Content ---->

</body>
</html>