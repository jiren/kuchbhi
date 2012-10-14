jQuery(document).ready(function($) {
  googleMap.init()
})

var googleMap = {

  center_lat_lng: [37.4419, -122.1419],
  map: null,
  markers: {},

  init: function(){
    var options = {
      center: new google.maps.LatLng(this.center_lat_lng[0], this.center_lat_lng[1]),
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    this.map = new google.maps.Map(document.getElementById("gmap"), options)

    this.southWest = new google.maps.LatLng(37.42145310364248, -122.20198148193361)
    this.northEast = new google.maps.LatLng(37.462341310602696, -122.08181851806643)
    this.infowindow = new google.maps.InfoWindow({
        size: new google.maps.Size(50,50)
    });
  },

  addMarker: function(ad){
    var that = this;
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(ad.lat, ad.lng),
      map: this.map,
      title: ad.title
    });

    marker.info_window_content = ad.title + '<br/> Price: ' + ad.amount
    this.markers[ad.id] = marker

    google.maps.event.addListener(marker, 'click', function() {
      that.infowindow.setContent(marker.info_window_content)
      that.infowindow.open(that.map,marker);
    });
  },
 
  ranndomLatLng: function(){
    var lngSpan = this.northEast.lng() - this.southWest.lng()
    var latSpan = this.northEast.lat() - this.southWest.lat();
    return [this.southWest.lat() + latSpan * Math.random(), this.southWest.lng() + lngSpan * Math.random()];
  },

  updateMarkers: function(filtering_result){
    var google_map = this;
    $.each(google_map.markers, function(){ this.setMap(null); })
    $.each(filtering_result, function(){
      google_map.markers[this.id].setMap(google_map.map);
    });
  }

};
