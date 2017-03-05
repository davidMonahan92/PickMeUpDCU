<!DOCTYPE HTML>

<html lang="en">

<head>
	<meta charset="utf-8">
	<meta Available Driver="viewport" content="width=device-width, initial-scale=1">
	<title>PickMeUpDCU</title>
	<!--Web imports-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<!--Imported files-->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/jquery.cookie.js"></script>

	<script>
		var jsonString;
		var tableString;

		<!--Format the user Id -->
		function formatId(idString){
		alert("Starting reformat");
			alert(idString);
			return idString.replace(/\D/g, '');
			
		}
		
		<!-- Adds Passengers -->
		function addPassenger(requestId) {
		
			alert("Adding passanger " + requestId);
			$
					.post(
							"http://localhost:8080/DCU-CarPool-pack-0.1.0/acceptPickUpRequest",
							{
								pickUpId : requestId,
								driverId : $.cookie('userId')
							}, function(data) {
								alert("In accept callback");
							});
		}
		$(document)
				.ready(
						function() {
							alert("requesting1")
							$
									.post(
											"http://localhost:8080/DCU-CarPool-pack-0.1.0/listAllPickUpRequestByDriverId",
											{
												driverId : $.cookie('userId')
											},
											function(data) {
												jsonString = JSON.stringify(data);
												tableString = "<table class=table table-striped table-bordered table-hover><thead><tr><th>Date</th><th>Location</th><th>Passenger</th><th>Choose</th></tr></thead><tbody>";
												$.each($.parseJSON(jsonString),	function(id, obj) {
																	var www = 12345;
																	tableString += '<tr><td>'
																			+ obj.pickUpDate
																			+ '</td><td>'
																			+ obj.pickUpAddress
																			+ '</td><td>'
																			+ obj.userId
																			+ '</td><td><td><button type="button" class="btn btn-primary" data-toggle="modal" href="#myModal">Manage Request</button><div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><h1>Manage Requests</h1></div><div class="modal-body"><p><br>Car Seats: <br> <span class="tab"></span><button type="submit" class="btn btn-primary" onclick="addPassenger(\' ' +obj.id +' \')" data-dismiss="modal">Accept</button><button type="submit" class="btn btn-primary" data-dismiss="modal" >Ignore</button></p></div><div class="modal-footer"><button type="button" class="btn btn-primary" data-dismiss="modal">Close</button></div></div></div></div></td></td></tr>';
																});
												tableString += '</tbody></table>';
												alert(tableString);
												document
														.getElementById("requestTablePlaceHolder").innerHTML = tableString;
											}, "json");

						});
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
	<!--Displays Driver Table with Passengers requesting lifts-->
	<div class="container">
		<h1>
			<span class="tab-header1"></span><b><u>Driver</u></b>
		</h1>

		<div id="requestTablePlaceHolder">
			<script>
				tableString
			</script>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<a
					href="plannedRoute1.jsp">
					<button type="Submit" class="btn btn-primary" onclick="requestLift()">Submit</button>
				</a>
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
