<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>PickMeUpDCU</title>
	
	<link href = "resources/css/bootstrap.min.css" rel = "stylesheet" type="text/css"/>
	<script src= "resources/js/jquery.js"></script>
	<script src= "resources/js/bootstrap.js"></script>
	<script src= "resources/js/jquery.cookie.js"></script>
	
	<script>
		<!--Check database to see if its your email-->
		function isAvail()
		{
			$.post("http://localhost:8080/DCU-CarPool-pack-0.1.0/isUserNow",
			{
				username:$("#email").val(),
			},
			function(data)
			{
				if(data.username == "")
				{
					alert(data.username + " is not a valid email");
					document.example.email.focus();
				}else{
					alert(data.username + "is your email");	
				}
			},"json");	
		}
		<!--Logins to your account-->
		function login()
		{
			alert("Starting login");
			$.post("http://localhost:8080/DCU-CarPool-pack-0.1.0/loginAction", {  
				username : $("#email").val(), 
				password : $("#pwd").val()
			}, 
			function (data){ 
			returned_data = data;
			alert("In Callback");
			alert(data.username);
			if(data.username == "" & data.password ==""){
			alert("No user found");
			}else{
				$.cookie("userId", data.id, { expires: 1, path: '/' });
				
				alert('UserId ' + data.id);
				}
			}, "json"); 
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
	
	<!-- Login Details-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1><b>Login in here</b></h1>
				<br>
				<form class="form-horizontal" role="form" name="example">
					<div class="form-group">
						<!--Email-->
						<label for="email"class="col-sm-2 control-label"> Email:</label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<input type="email" id="email" class="form-control" onblur="isAvail()" placeholder="Enter Email..."/>
						</div>
					</div>
					<!--Password-->
					<div class="form-group">
						<label for="pwd"class="col-sm-2 control-label"> Password:</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="pwd" placeholder="Enter Password here...">
						</div>
					</div>
				</form>
				<!--Sumbit button-->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<a href="index1.jsp">
							<button class="btn btn-primary" onclick="login()">Submit</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Prev -->
	<div class="container">
		<ul class="pager">
			<li><a href="index.jsp">Previous</a></li>
		</ul>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				
				<hr/>
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