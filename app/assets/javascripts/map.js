jQuery(document).ready(function($) {
  
    /*
  if(this.ads){
    this.center_lat = this.ads[0].lat;
    this.center_lng = this.ads[0].lng;
  }

  googleMap.init(this.center_lat || 37.4419, this.center_lng || -122.1419)
  */

})

var googleMap = {

  map: null,
  markers: {},
  center_lng: 37.4419,
  center_lat: -122.1419,

  init: function(ads){
    if(ads){
      var center_lat = ads[0].lat || 37.4419;
      var center_lng = ads[0].lng || -122.1419; 
    }

    var options = {
      center: new google.maps.LatLng(center_lat, center_lng),
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    this.map = new google.maps.Map(document.getElementById("gmap"), options)

    this.southWest = new google.maps.LatLng(37.42145310364248, -122.20198148193361)
    this.northEast = new google.maps.LatLng(37.462341310602696, -122.08181851806643)
    this.infowindow = new google.maps.InfoWindow({
        size: new google.maps.Size(50,50)
    });

    var that = this;
    $.each(ads || [], function(){
      that.addMarker(this);
    });
  },

  addMarker: function(ad){
    var that = this;
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(ad.lat, ad.lng),
      map: this.map,
      title: ad.description
    });

    marker.info_window_content = 'Category: ' + ad.category.name + '<br/>' + ad.address + '<br/> Price: ' + ad.price;
    this.markers[ad._id] = marker

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
      google_map.markers[this._id].setMap(google_map.map);
    });
  }

};
