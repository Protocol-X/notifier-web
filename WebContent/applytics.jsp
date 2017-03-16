<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.Arrays" %>
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

  <link rel="stylesheet" href="select/css/prism.css">
  <link rel="stylesheet" href="select/css/chosen.css">
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
			 <h2>How'z your application(s) performing</h2>
			 Choose the application from the dropdown(Max 5 Only)
			 <hr />
			  <form class="form-horizontal" action="applytics" method="post">
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="appname">Application Name</label>
			      <div class="col-sm-10">
						<select data-placeholder="Application Name"  name="apps" multiple class="chosen-select" style="width:400px;" required>
				            <option value=""></option>
				            <c:forEach items="${dapps}" var="dapp">
				            	<option><c:out value="${dapp}" /></option>
				            </c:forEach>
				         </select>			        
			      </div>
			    </div>
			    <div class="form-group">
			      <div class="col-sm-offset-2 col-sm-10">
			        <input type="submit" value="View" name="action" class="btn btn-primary"/>
			      </div>
			    </div>
			  </form>
			</div> 
			<div class="row">
				<div class="col-sm-10">
					<c:if test ="${pageContext.request.method =='POST'}">  
					
						<canvas id="myChart" height="100px"></canvas>
						
						<script>var ctx = document.getElementById("myChart").getContext("2d");</script>
					
							
							
								<script>
								var myChart = new Chart(ctx, {
								    type: 'line',
								    data: {
								        labels: [01,02,03,04,05,06,07,08,09,10],
								        datasets: [
								           <c:out value="${appchart}" escapeXml="false" ></c:out>
								           ]
								    },
								    options: {
								        scales: {
								            yAxes: [{
								                ticks: {
								                    beginAtZero:true
								                }
								            }]
								        }
								    }
								});
								</script>						
							
					</c:if> 
					
					
				</div>
			</div>



								 
        </div>

  <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
  <script src="select/js/chosen.jquery.js" type="text/javascript"></script>
  <script src="select/js/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    var config = {
      '.chosen-select'           	: {},
      '.chosen-select-deselect'  	: {allow_single_deselect:true},
      '.chosen-select-no-single' 	: {disable_search_threshold:5},
      '.chosen-select-no-results'	: {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     	: {width:"95%"},
      '.chosen-select'				: {max_selected_options:5}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
    
    
  </script>
	<!---End :: Actual Content ---->
	<jsp:directive.include file="./about.jsp" />   
</body>
</html>