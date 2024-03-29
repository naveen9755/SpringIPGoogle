<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
 <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=API_KEY&sensor=SET_TO_TRUE_OR_FALSE">
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=API_KEY&sensor=SET_TO_TRUE_OR_FALSE"
  type="text/javascript"></script>
<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
	<h2>Spring MVC + jQuery + Google Map + IP Serach By Naveen Singh </h2>

	<div>
		<input type="text" placeholder="0.0.0.0" id="w-input-search" value="">
		<span>
			<button id="w-button-search" type="button">Search</button>
		</span>
	</div>

	<script>
		$(document)
				.ready(
						function() {

							$("#w-button-search")
									.click(
											function() {

												$
														.getJSON(
																"${pageContext.request.contextPath}/getLocationByIpAddress",
																{
																	ipAddress : $(
																			'#w-input-search')
																			.val()
																},
																function(data) {

																	var data = JSON
																			.stringify(data);
																	var json = JSON
																			.parse(data);

																	showMap(
																			json["latitude"],
																			json["longitude"])

																	$("#result")
																			.html(
																					data)

																}).done(
																function() {
																}).fail(
																function() {
																}).complete(
																function() {
																});

											});

							var map;

							function showMap(latitude, longitude) {

								var googleLatandLong = new google.maps.LatLng(
										latitude, longitude);

								var mapOptions = {
									zoom : 5,
									center : googleLatandLong,
									mapTypeId : google.maps.MapTypeId.ROADMAP
								};

								var mapDiv = document.getElementById("map");
								map = new google.maps.Map(mapDiv, mapOptions);

								var title = "Server Location";
								addMarker(map, googleLatandLong, title, "");

							}

							function addMarker(map, latlong, title, content) {

								var markerOptions = {
									position : latlong,
									map : map,
									title : title,
									clickable : true
								};
								var marker = new google.maps.Marker(
										markerOptions);
							}

						});
	</script>
	<br />
	<div id="result"></div>
	<br />
	<div style="width: 600px; height: 400px" id="map"></div>

</body>
</html>