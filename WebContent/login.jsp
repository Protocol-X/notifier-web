<html><head>
        <meta charset="utf-8">
        <title>Eyes :: Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <script src="./js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="./css/eyes-custom.css" 	 						media="all" type="text/css">  
        <script src="./js/lumino.glyphs.js"></script>
        <script src="./charts/Chart.js"></script>
    </head><body>
	<div class="navbar navbar-inverse navbar-fixed-top shadow">
	    <div class="container nav-container">
	        <div class="navbar-header">
	            <a href="#" class="navbar-brand"> <span><img src="./images/5.png" style='height: 150%; padding-right:20px;'/></span></a>
			    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
		</div>
	</div>
<%session.invalidate(); %>
	
<div class="container login-container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall shadow">
                <img class="profile-img" src="./images/1.png" alt="">
				
					<form class="form-signin" action="./login_validate" method="post">
						<input type="text" name="user" class="form-control" placeholder="User Name" required autofocus>
						<input type="password" name="pwd" class="form-control" placeholder="Password" required>
						<div class="cent-msg errmsg">
						<%
						String message = request.getParameter("message");
						if(message!=null){
							out.print("Login Failed..!");
						}
						%>
						</div>
						<button class="btn btn-primary btn-block" type="submit">Sign in</button>                              
					</form>
            </div>            
        </div>
    </div>
</div>

</body></html>