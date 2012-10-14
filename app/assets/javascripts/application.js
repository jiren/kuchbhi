// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require map
//= require autocomplete-rails
//= require jquery-ui
//= require jquery-ui-addresspicker
//= require jquery_nested_form
//= require home
// require_tree .

jQuery(document).ready(function($) {
  $('.map-it, .top-btn').tooltip({placement: 'bottom'});

  $('#gmap_btn').click(function() {
    $('#gmap').slideToggle('slow');
    return false;
  });

  $('.close, .cancel').live('click', function(){
    $('.modal').remove();
    $('.modal-backdrop').remove();
  });

  $('#all_categories, .category').attr('checked', true);
  $('#all_categories').click(function(){
    $('.category').attr('checked', $(this).is(':checked'));
    Category.filter();
  });

  $('.category').click(function(){
    Category.filter();
  });

  googleMap.init(ads);

  $('.map-it').live('click', function(e){
    var ad_id = $(this).data('id');
    var marker = googleMap.markers[ad_id];

    $('#gmap').show();
    googleMap.infowindow.setContent(marker.info_window_content);
    googleMap.infowindow.open(googleMap.map, marker);
    false
  });

  $('.alert-close').live('click', function(){
    $('.alert').fadeOut('slow');
  });

});

var Category = {}
Category.filter = function(){
  $('.ad').hide();

  $('.category:checked').each(function(){
    $('.c_' + $(this).attr('id')).show();
  })
};



