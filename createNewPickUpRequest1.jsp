<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
    <title>PickMeUpDCU</title>
	
	<link href = "resources/css/bootstrap.min.css" rel = "stylesheet" type="text/css"/>
	<script src= "resources/js/jquery.js"></script>
	<script src= "resources/js/bootstrap.js"></script>
	
	
	<link rel ="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
	
	<script src= "resources/js/jquery.cookie.js"></script>

	<script>
	<!--Updates users route -->
		function updateRoute()
		{
			$.post("http://localhost:8080/DCU-CarPool-pack-0.1.0/createPickUpRequest", 
			{
				pickUpDate:$("#datepicker").val(),
				userId:$.cookie('userId'),
				pickUpAddress:$("#from").val()
			},
			function(data)
			{
				alert("in callback");
				data.pickUpAddress;
			}, "json" );
		}
	</script>		
	
    <script>
		<!--function to use date box -->
		$(function() {
			$( "#datepicker" ).datepicker();
			$( "#anim" ).change(function() {
				$( "#datepicker" ).datepicker( "option", $( this ).val() );
			});
		});
		
		<!--Autocomplete boxes for directions-->
		google.maps.event.addDomListener(window, 'load', function () {
			var places = new google.maps.places.Autocomplete(document.getElementById('from'));
			google.maps.event.addListener(places, 'place_changed', function () {
				var place = places.getPlace();
			});
			var places1 = new google.maps.places.Autocomplete(document.getElementById('to'));
			google.maps.event.addListener(places1, 'place_changed', function () {
				var place1 = places1.getPlace();
			});
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
	

	<div class="container">
		<h1><b>Calculate your route</b></h1>
		<br>
		<div class="row">
			<div class="col-md-4">
				<form class="form-horizontal" id="calculate-route" name="calculate-route" action="#" method="get">
					<!--Passenger origin point-->
					<div class="form-group">	
						<label for="from" class="col-sm-2 control-label"> From: </label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<input type="text" id="from" name="from" required="required" placeholder="An address" size="30" />
						</div>
					</div>
					<!--Passenger destination point-->
					<div class="form-group">
						<label for="to" class="col-sm-2 control-label">To:</label>
						<div class="col-sm-6"><!--Input box size changes here-->
							<input type="text" id="to" name="to" required="required" placeholder="Another address" size="30" />
						</div>
					</div>
					<!--Date for pick up -->
					<div class="form-group">
						<label for="to" class="col-sm-2 control-label">Date:</label>
						<div class="col-sm-6">
							<input type="text" id="datepicker" placeholder="Click Date box" size="30"/>
						</div>
					</div>
				</form>
				<!--Displays message to let passenger know their request was successful when submit clicked-->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<button type="submit" class="btn btn-primary" onclick="updateRoute()" data-toggle="modal" href="#myModal1">Submit</button>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h2>Dear Passenger</h2>
								</div>
								<div class="modal-body">
									<p>Your Request has been submitted and you will receive an email if a driver accepts your request</p>
								</div>
								<div class="modal-footer">
									<button type="button" onclick="location.href='index1.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
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