// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $("#log_in_btn").click(function() {
    $('#placeholder').text("Invalid Login");
    $('input').css('border', '1px solid red');
  });
});