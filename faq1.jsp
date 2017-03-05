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
	
	
	<!--FAQ -->
	<div class="container">
		<h1>FAQ</h1>
		<div class="panel-group" id="accordion">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">What is PickMeUpDCU?</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">PickMeUpDCU is a carpooling network that connects both Students and Faculty members with similar commute routes to be able to share rides, 
						all through our easy to use Web app.<br><br>Our goal is to make ridesharing easy and flexible so we can help reduce the number of people
						driving cars alone on the roads – which helps reduce traffic congestion, CO2 emissions and also helps make new friends!<br><br>
						PickMeUpDCU is 3rd Project made specifically for members of Dublin City University.
					</div>
				</div>
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Do We deal with Money</a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">PickMeUpDCU does not deal with taking money from either the Driver or the Passenger<br><br>Our goal is just to connect both
					Driver and Passenger to give rough estimates on fuel costs, travel time and also the recommended amount the driver should charge per Passenger 
					for the lift. 
					</div>
				</div>
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Will this affect my insurance</a>
					</h4>
				</div>
				
				<div id="collapse4" class="panel-collapse collapse">
					<div class="panel-body">No, your insurance will not be affected or need to change in order to drive or ride with PickMeUpDCU. 
					Your insurance coverage will act just as it does if you were driving a friend, family member, or a neighbour. PickMeUpDCU is different from 
					other ridesharing companies because our drivers don’t actually earn a “profit” so there is no impact on the driver's 
					insurance requirements or tax implications. The purpose of PickMeUpDCU is to enable both the passengers and the drivers to lower the cost of their travel and at no stage is it a profit making venture. The goal is for people to be able to easily share transportation costs to make carpooling a way to save money and 
					take extra cars off the road..
					</div>
				</div>
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse5">What safety measures are in place for sharing a journey with someone I don’t know?</a>
					</h4>
				</div>
				<div id="collapse5" class="panel-collapse collapse">
					<div class="panel-body">To avail of PickMeUpDCU's carpooling feature every user must have a valid Dublin City University email. 
					PickMeUpDCU also keeps a backup of every single pickup and drop-off location for both drivers and passengers.

					Of course, always take normal precautions when booking a ride, as you would when meeting someone for the first time. For example, meet in a public 
					place or street and don’t give out your home address. Don’t be afraid to ask for ID when you meet (a driving license is a good idea).
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