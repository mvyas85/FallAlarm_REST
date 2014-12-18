<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Fall Alarm - About Us</title>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HELP - FallArm</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/bootstrapvalidator.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script
src="http://maps.googleapis.com/maps/api/js">
</script>
<script src="http://www.google.com/jsapi?key=ABQIAAAAlJFc1lrstqhgTl3ZYo38bBQcfCcww1WgMTxEFsdaTsnOXOVOUhTplLhHcmgnaY0u87hQyd-n-kiOqQ"></script>
		

<script>

	var xx = <%= request.getAttribute("locationX") %>;
	var yy = <%= request.getAttribute("locationY") %>;


	if( xx === null && yy === null){
		locateMe();
	}else{
		locateFall(xx,yy);
	}
	
	function locateFall(newX,newY){
		console.log('locate me started running' +newX,newY);
	    var myCenter=new google.maps.LatLng(newX,newY);
		
		function initialize()
		{
		var mapProp = {
		  center:myCenter,
		  zoom:13,
		  mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
		
		var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		
		//alert('value for pName is '+ pName);
		var marker=new google.maps.Marker({
		  position:myCenter,
		  });
		
		marker.setMap(map);
		
		var pid = document.getElementById("pid").value;
		var pName = document.getElementById("pName").value;
		var pPhone = document.getElementById("pPhone").value;
		
		var infowindow = new google.maps.InfoWindow({
			  content:'<b style="text-align:center">FALL !!</b><br/><b>PID:</b>'+pid+'<br/><b>Name:</b>'+pName+'<br/><b>Phone:</b>'+pPhone
			  });

			infowindow.open(map,marker);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	}
	
	function locateMe(){
		(function LocateMe() {
			google.load("maps", "2");
			google.setOnLoadCallback(function () {
				// Create map
				var map = new google.maps.Map2(document.getElementById("googleMap")),
					markerText = "<h2>You are here</h2><p>Nice with geolocation, ain't it?</p>",
					markOutLocation = function (lat, long) {
						var latLong = new google.maps.LatLng(lat, long),
							marker = new google.maps.Marker(latLong);
						map.setCenter(latLong, 13);
						map.addOverlay(marker);
						marker.openInfoWindow(markerText);
						google.maps.Event.addListener(marker, "click", function () {
							marker.openInfoWindow(markerText);
						});
					};
					map.setUIToDefault();

				// Check for geolocation support	
				if (navigator.geolocation) {
					// Get current position
					navigator.geolocation.getCurrentPosition(function (position) {
							// Success!
							markOutLocation(position.coords.latitude, position.coords.longitude);
						}, 
						function () {
							// Gelocation fallback: Defaults to Stockholm, Sweden
							markerText = "<p>Please accept geolocation for me to be able to find you. <br>I've put you in Stockholm for now.</p>";
							markOutLocation(59.3325215, 18.0643818);
						}
					);
				}
				else {
					// No geolocation fallback: Defaults to Eeaster Island, Chile
					markerText = "<p>No location support. Try Easter Island for now. :-)</p>";
					markOutLocation(-27.121192, -109.366424);
				}
			});	
		})();
	}
</script>

</head>

<body>
<%@ include file="./navBar.jsp"%>
    <!-- Call to Action -->
    
    
     <aside class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>View location on map</h3>
				    <input  type="hidden" id="pid" name="pid" value="${pid}"/> 
				    <input  type="hidden" id="pName" name="pName" value="${pName}" /> 
				    <input  type="hidden" id="pPhone" name="pPhone" value="${pPhone}" /> 
                    <!-- <a href="#" class="btn btn-lg btn-dark" onClick="locateMe()">Look at Me!</a> -->
                </div>
            </div>
        </div>
    </aside>

    <!-- Map -->
    <section id="contact" class="map" width="80%" height="100%" >    
		<div id="googleMap" style="height:400px;margin:0px auto;" ></div>
    </section>

</body>

</html>