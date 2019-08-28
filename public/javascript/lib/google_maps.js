var map;

function initMap() {

  var initialLatLng = { //initial coordinates by default (Santiago, Chile)
    lat: -33.447984,
    lng: -70.669608
  };

  var map = new google.maps.Map(document.getElementById('map'), { //init map
    zoom: 11,
    center: initialLatLng
  });

  var markerIcon = "/images/vehicle_marker.png";
  
  var waypoints = JSON.parse(document.getElementById('map').dataset.waypoints); //get all the most recent waypoints
  
  var bounds = new google.maps.LatLngBounds();
  
  waypoints.forEach(function (waypoint) { //iterates over each waypoint per vehicle to display markers on map
    var latLng = new google.maps.LatLng(waypoint.latitude, waypoint.longitude);
    
    var contentString = `Identifier: ${waypoint.vehicle_identifier} - Lat: ${waypoint.latitude} - Lng: ${waypoint.longitude}`;
    var infoWindow = new google.maps.InfoWindow({
      content: contentString
    });
    
    var marker = new google.maps.Marker({ //display marker
      position: latLng,
      map: map,
      icon: markerIcon
    });

    marker.addListener('click', function() { //click on each marker to display her own data
      infoWindow.open(map, marker);
    });

    bounds.extend(marker.position);

  });

  if ($("#map").data("waypoints").length > 0) { //center to the current markers on map, otherwise show initial coordenates
    map.fitBounds(bounds); 
  } 

}
