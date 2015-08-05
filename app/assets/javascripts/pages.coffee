# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`
var map;
function initialize() {
    myLatLng = new google.maps.LatLng(-23.60894, -46.67149);
    var mapOptions = {
        zoom: 15,
        center: myLatLng
    }
    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: 'Estamos Aqui!'
    });
    console.log("i was called :D");
}
google.maps.event.addDomListener(window, 'load', initialize);
`