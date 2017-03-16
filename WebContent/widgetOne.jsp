<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3> In Last 24 Hours..</h3>
		
    <div class="row">
				<div class="col-sm-3">
					<div class="panel pborder">
					<div class="panel-heading  ">Total Applications</div>
						<div class="panel-body">					
							<span class="glyphicon glyphicon-flash gicon-blue"></span>
							<span class="msg">
								<a href="AppsView?action=all" class="panel_a"><c:out value="${widgetOne.get(0) + widgetOne.get(1) + widgetOne.get(2)}" /></a>
							</span>							
						</div>
					</div>				
			   </div>			
		
		<div class="col-sm-3">
			<div class="panel pborder">
				<div class="panel-heading  ">Successful</div>
				<div class="panel-body">					
					<span class="glyphicon glyphicon-ok gicon-green"></span>
					<span class="msg">
						<a href="AppsView?action=success" class="panel_a"><c:out value="${widgetOne.get(0)}" /> </a>
					</span>
					
				</div>
			</div>
		</div>
		
        <div class="col-sm-3">
			<div class="panel pborder">
				<div class="panel-heading  ">Killed</div>
				<div class="panel-body">					
					<span class="glyphicon glyphicon-remove gicon-red"></span>
					<span class="msg">
						<a href="AppsView?action=killed" class="panel_a"><c:out value="${widgetOne.get(1)}" /> </a>
					</span>
				</div>
			</div>		
		</div>
		
        <div class="col-sm-3">
		
			<div class="panel pborder">
				<div class="panel-heading  ">Failed</div>
				<div class="panel-body">					
					<span class="glyphicon glyphicon-minus gicon-orange"></span>
					<span class="msg cent-msg">
						<a href="AppsView?action=failed" class="panel_a"><c:out value="${widgetOne.get(2)}" /> </a>
					</span>
				</div>
			</div>
		
		</div>
	</div>