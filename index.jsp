<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
	
		<title>PickMeUpDCU</title>
		<link href = "resources/css/bootstrap.min.css" rel = "stylesheet" type="text/css"/>
		<script src= "resources/js/jquery.js"></script>
		<script src= "resources/js/bootstrap.js"></script>
		<style>
			body{
				background:grey;
			}
			.jumbotron 
			{
				background-color: white;				
				margin-bottom: 0; /* Remove the default bottom margin of .jumbotron */
			}
			span.tab{
				padding: 0 120px; /* Or desired space*/
			}
		</style>
	</head>
	<body>
	<!--Navbar-->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">PickMeUpDCU</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="faq.jsp">FAQ</a></li>
					<li><a href="contact.jsp">Feedback</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="saveNewUser.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!--Displays the Welcome Jumbotron-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron text-center vertical-center">
					<h1>Welcome to <br>
					<img src="resources/img/logo.jpg" ></h1>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer & Modal -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<hr/>
				<!--Copyright terms and conditions -->
				<p>Copyright &copy; PickMeUpDCU.
					<a data-toggle="modal" href="#myModal">Terms and Conditions</a>
				</p>
				
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h2>Terms & Conditions</h2>
							</div>
							<div class="modal-body">
								<p>PickMeUpDCU does not accept any liability for any happening which might occur as a result of using this Application. </p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>