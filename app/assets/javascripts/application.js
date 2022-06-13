// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets


// double click on the heart icon
$(".fa-heart").dblclick(function () {
  $(".notification-bubble").show(400);
});

$(document).on("scroll", function () {
  if ($(document).scrollTop() > 50) {
    $(".navigation").addClass("shrink");
  } else {
    $(".navigation").removeClass("shrink");
  }
});

$('.carousel').carousel({
  interval: 2000
})
