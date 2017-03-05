<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>PickMeUpDCU</title>
	
	<link href = "resources/css/bootstrap.min.css" rel = "stylesheet" type="text/css"/>
	<script src= "resources/js/jquery.js"></script>
	<script src= "resources/js/bootstrap.js"></script>	
	
	<script>
		<!--Changes the password-->
		function changePassword(){
		alert("Sending");
			$.post("http://localhost:8080/DCU-CarPool-pack-0.1.0/updatePassword", {  <!-- URL we wish to request-->
				username : $("#uname").val(), <!--Pass this data to send with request-->
				oldPassword: $("#pwd").val(),
				newPassword : $("#newpwd").val() <!--Pass this data to send with request-->	
				
			}, 
			function (data) <!-- callback function-->
			{
				alert("In Callback");
				data.username; <!-- data returned -->
				data.newPassword; <!-- data returned -->
				alert(data.username);
			}, "json"); <!--type of data returned-->
		}
	</script>
	
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
				<a class="navbar-brand" href="index1.jsp">PickMeUpDCU</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="index1.jsp">Home</a></li>
					<li><a href="faq1.jsp">FAQ</a></li>
					<li><a href="contact1.jsp">Feedback</a></li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Role<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="createNewRoute1.jsp">Driving</a></li>
								<li class="divider"></li>
								<li><a href="createNewPickUpRequest1.jsp">Passenger</a></li>
							</ul>
					</li>									
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-wrench">Settings</span></a>
							<ul class="dropdown-menu">
								<li><a href="saveNewUserInformation.jsp">Update Account</a></li>
								<li class="divider"></li>
								<li><a href="updatePassword1.jsp">Update Password</a></li>
								<li class="divider"></li>
								<li><a href="deleteAccount1.jsp">Delete Account</a></li>
							</ul>
					</li>	
					<!--Sign out button-->
					<li><a data-toggle="modal" href="#myModal2"><span class="glyphicon glyphicon-user"></span> Sign out</a></li>
					<!-- Sign out box Modal -->
					<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h2>Signing Out</h2>
								</div>
								<div class="modal-body">
									<p>Hope you enjoyed your experience</p>
								</div>
								<div class="modal-footer">
									<button type="button" onclick="location.href='login.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</ul>
			</div>
		</div>
	</nav>
	
	
	<!-- Login Details-->
	<div class="container">
		<h2> Change Your Password </h2>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal">
					<div class="form-group">
						<label for="uname" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<input type="email" class="form-control" id="uname" placeholder="Enter a username..."/>
						</div>
					</div>
					<div class="form-group">
						<label for="pwd" class="col-sm-2 control-label"> Old Password:</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="pwd" placeholder="Enter old Password here...">
						</div>
					</div>
					<div class="form-group">
						<label for="newpwd" class="col-sm-2 control-label"> New Password:</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="newpwd" placeholder="Enter new Password here...">
						</div>
					</div>
				</form>
				<!--Submit Button -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<a href="index1.jsp">
							<button type="button" class="btn btn-primary" onclick="createAccount()">Submit</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Prev -->
	<div class="container">
		<ul class="pager">
			<li><a href="index1.jsp">Previous</a></li>
		</ul>
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