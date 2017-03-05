<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>PickMeUpDCU</title>
	
	<link href = "resources/css/bootstrap.min.css" rel = "stylesheet" type="text/css"/>
	<script src= "resources/js/jquery.js"></script>
	<script src= "resources/js/bootstrap.js"></script>
	
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
	
	<script src= "resources/js/jquery.cookie.js"></script>
	
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
	
    <script>
		var rendererOptions = {
		  draggable: false
		};
		var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);;
		var directionsService = new google.maps.DirectionsService();
		var map;

		var Ireland = new google.maps.LatLng(53.350140, -6.266155);

		function initialize() 
		{
			var mapOptions = {
				zoom: 7,
				center: Ireland
			};
			map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
			directionsDisplay.setMap(map);
			directionsDisplay.setPanel(document.getElementById('directionsPanel'));
	
			google.maps.event.addListener(directionsDisplay, 'directions_changed', function() 
			{
				computeTotalDistance(directionsDisplay.getDirections());
			});
			

			calcRoute();
		}
		
		<!--Generates the visual directions on the map-->
		function calcRoute() {

			var request = {
				origin: 'Julianstown', //will take this information for the carPool Object, this is a sample
				destination: 'Dublin City university',
				waypoints:[{location: 'Balbriggan'}],
				travelMode: google.maps.TravelMode.DRIVING
			};
			directionsService.route(request, function(response, status)
			{
				if (status == google.maps.DirectionsStatus.OK)
				{
					//$('directionsPanel').empty(); //clear direction panels before adding new directions
					directionsDisplay.setDirections(response);
				}
				else
				{ //error for no routes
					if(status == 'ZERO_RESULTS')
					{
						alert('No route could be found.');
					}
					else if(status == 'UNKNOWN_ERROR')
					{
						alert('Server error, your request couldnt be processed, Try again.');
					}
					else if (status == 'OVER_QUERY_LIMIT') 
					{
						alert('The webpage has gone over the requests limit in too short a period of time.');
					}
					else if (status == 'NOT_FOUND') 
					{
						alert('At least one of the origin, destination, or waypoints could not be geocoded.');
					} 
					else if (status == 'INVALID_REQUEST') 
					{
						alert('The DirectionsRequest provided was invalid.');
					}
					else 
					{
						alert("There was an unknown error in your request. Requeststatus: nn"+status);
					}
				}
			});
		}
		
		$(document).ready(function() 
		{	
			<!--Fuel Calculator Algorithm -->
			var fuelCostCalcer = {
			//define the input fields
			inputAr : new Array( 'kilometres', 'kpl', 'cost_per_litre' ),
			//define the results fields
			resultAr : new Array( 'gallons_used', 'litres_used', 'total_cost' ),
			//function to init object, set listeners, make first results
			init : function(){
				var $fi;
				//for each input field, add a change listener
				for( var i in this.inputAr )
				{
					$fi = $('#'+ this.inputAr[i] +'_fi'); //select the field as jQuery object
					//bind the events, triggered when value changes
					$fi.bind( 'keyup change', this.doCalc );
				}
				//trigger change on the last field, to init the result
				$fi.trigger( 'change' );
			},
			//triggerd by field value change
			doCalc : function(eventObj){

				/* CHECK AND SET THE INPUT VARS */

				//the inputVars obj

				var inputVars = {};

				//do input validation

				var isValid = true;

				for( var i in fuelCostCalcer.inputAr )
				{
					var fiId = fuelCostCalcer.inputAr[i]; //get field ID
					var val = $('#'+fiId+'_fi').val(); //get the value from the input field
					//if is in valid value
					if( isNaN(parseFloat(val)) || val < 0 || val > 10000000 ){
						isValid = false;
						break;
					}
					//else set as property in this object
					else
						inputVars[ fiId ] = val;
				}
				/* SET THE RESULT VARS */

				//the resultVars obj

				var resultVars = {};

				//if inputs are valid then calculate the results
				if( isValid )
				{
					var kilometresPerLitre = inputVars['kpl'] / 2.35214583; //4.5 is the litres in a gallon
					resultVars['gallons_used'] = inputVars['kilometres'] / inputVars['kpl'];
					resultVars['litres_used'] = inputVars['kilometres'] / kilometresPerLitre;
					resultVars['total_cost'] = resultVars['litres_used'] * inputVars['cost_per_litre'];
				}
				//not valid, so set all result vars to 0
				else
				{
					for( var i in fuelCostCalcer.resultAr )
						resultVars[ fuelCostCalcer.resultAr[i] ] = 0;
				}
				/* SET RESULTS IN TO HTML */
				for( var i in fuelCostCalcer.resultAr )
				{
					var laId = fuelCostCalcer.resultAr[i]; //get label/span ID

					$('#'+laId+'_la').text( resultVars[laId].toFixed(2) );
				}
			}
		};
		fuelCostCalcer.init();
		});
		
		
		<!-- Calculates total distance of journey -->
		function computeTotalDistance(result) 
		{
			var total = 0;
			var myroute = result.routes[0];
			for (var i = 0; i < myroute.legs.length; i++) 
			{
				total += myroute.legs[i].distance.value;
			}
			total = total / 1000.0;
			document.getElementById('total').innerHTML = total + ' km';
		}

		google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
	<!--Navigation bar-->
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
	
  
	<!--displays the map -->
    <div id="map-canvas" style="float:right;width:70%; height:100%"></div>
	
	<!--displays written directions of inputted route-->
    <div id="directionsPanel" style="float:left;width:30%;height 100%">
		
		<div align="center" style="margin-bottom: 15px">
			<!--Print button-->
			<input type="button" onClick="window.print()" value="Print Directions" id="printDir"/>
			</div>
				<!--Fuel Calculator-->
				<p><b>&nbsp Total Distance:</b> <span id="total"></span></p>
				<p>
					<h3>&nbsp Inputs:</h3>
					<p>
						&nbsp    I am travelling
						<input type="text" value="100" id="kilometres_fi" size="4">
						kilometres
					</p>
					<p>
						&nbsp    My car averages
						<input type="text" value="30" id="kpl_fi" size="4">
						kilometres to the litre
					</p>
					<p>
						&nbsp    The current price for a litre is €
						<input type="text" value="1.30" id="cost_per_litre_fi" size="4">
					</p>
					<h3>&nbsp Results:</h3>
					<p>
						&nbsp You will use approx
						<span id="litres_used_la">X</span>
						litres
					</p>
					<p>
						&nbsp Which will cost you:
						<b>€<span id="total_cost_la">Y</span></b>
					</p>
				</p>
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