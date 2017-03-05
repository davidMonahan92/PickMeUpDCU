<!DOCTYPE HTML>

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
		<!--Creates the update account -->
		function createAccount()
		{	
			$.post("http://localhost:8080/DCU-CarPool-pack-0.1.0/saveNewUserInformation", 
			{
				firstname:$("#fname").val(),
				surname:$("#sname").val(),
				age:$("#age").val(),
				sex:$("#gender").val(),
				dcuMember:$("#dcu").val(),
				carRole:$("#role").val(),
				smoker:$("#smoker").val(),
				homeAddress:$("#address").val(),
				carSeats:$("#seats").val(),
				mpg:$("#mpg").val(),
				carDescription:$("#description").val(),
				driverId :$.cookie('userId')
			},
			function(data)
			{
				data.firstname;
				data.surname;
				data.gender;
				data.dcuRole;
				data.role;
				data.smoker;
				data.address;
				data.seats;
			}, "json" );
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
	
	
	<!-- Creating an Account -->
	<div class="container">
		<h1>Create a User Account</h1>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal">
					<!--First Name-->
					<div class="form-group">
						<label for="fname" class="col-sm-2 control-label">First Name</label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<input type="text" class="form-control" id="fname" placeholder="Enter First Name..."/>
						</div>
					</div>
					<!--Second Name-->
					<div class="form-group">
						<label for="sname" class="col-sm-2 control-label">Surname</label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<input type="text" class="form-control" id="sname" placeholder="Enter Surname..."/>
						</div>
					</div>
					<!--Age-->						
					<div class="form-group">
						<label for="age" class="col-sm-2 control-label">Age</label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<input type="text" class="form-control" id="age" placeholder="Enter Age..."/>
						</div>
					</div>
					
					<!--Gender choice-->
					<div class="form-group">
						<label class="col-sm-2 control-label">Gender</label>
						<div class="col-sm-6">
							<label for="gender" class="radio-inline">
								<input type="radio" id="gender" name="genderRadio" value="male"/>Male
							</label>
							<label for="gender" class="radio-inline">
								<input type="radio" id="gender" name="genderRadio" value="female"/>Female
							</label>
						</div>
					</div>
					
					<!--DCU Affiliation-->
					<div class="form-group">
						<label for="dcu" class="col-sm-2 control-label">DCU Affiliation</label>
						<div class="col-sm-6">
							<select class="form-control">
								<option>Student</option>
								<option>Staff Member</option>
							</select>
						</div>
					</div>
					<!--Role for the carpooling application-->
					<div class="form-group">
						<label for="role" class="col-sm-2 control-label">Role</label>
						<div class="col-sm-6">
							<select class="form-control">
								<option>Driver</option>
								<option>Passenger</option>
								<option>Both</option>
							</select>
						</div>
					</div>
					<!--Smoker-->
					<div class="form-group">
						<label for="smoker" class="col-sm-2 control-label">Smoker</label>
						<div class="col-sm-6">
							<select class="form-control">
								<option>Yes</option>
								<option>No</option>
							</select>
						</div>
					</div>
					<!--Car seats available-->
					<div class="form-group">
						<label for="seats" class="col-sm-2 control-label">Number of car seats</label>
						<div class="col-sm-6">
							<select class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
							</select>
						</div>
					</div>
					<!--Miles per gallon -->
					<div class="form-group">
						<label for="mpg" class="col-sm-2 control-label">MPG</label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<input type="text" class="form-control" id="mpg" placeholder="Enter your cars MPG"/>
							If you are unsure of your MPG click <a href="http://www.fuel-economy.co.uk/mpg.php" target="_blank">here</a>
						</div>
					</div>
					<!--Car Description-->
					<div class="form-group">
						<label for="car" class="col-sm-2 control-label">Car Description</label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<textarea class="form-control" id="description" rows="3" placeholder="Describe here..."></textarea>
						</div>
					</div>
					
					
				</form>
				<!--Submit Button -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<a href="index1.jsp">
							<button type="submit" class="btn btn-primary" onclick="createAccount()">Submit</button>
						</a>
					</div>
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