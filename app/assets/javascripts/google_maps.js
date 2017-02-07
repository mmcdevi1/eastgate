function initMap() {
  var uluru = {lat: 40.7622500, lng: -73.9723700};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: uluru
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}