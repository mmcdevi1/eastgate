// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  var windowHeight = $(window).height();
  var headerHeight = $('.navbar').height();

  $(window).on("scroll", function() {
    if($(window).scrollTop() > 50) {
      $(".header-inverse").css("background-color", "#000");
    } else {
      $(".header-inverse").css("background-color", "rgba(0,0,0,0)");
    }
  });

  $("#div_wrapper").on("scroll", function() {
    if($("#div_wrapper").scrollTop() > 50) {
      $(".header-inverse").css("background-color", "#000");
    } else {
      $(".header-inverse").css("background-color", "rgba(0,0,0,0)");
    }
  });

  $('.nav a').click(function () {
    $('.navbar-collapse').removeClass("in");
  });

  if ( window.location.href.includes("#contactform") ) {
    $(window).load(function () {
      $("html, body").animate({ scrollTop: $(document).height() }, 500);
    });
    $("#first_name_input").focus();
    //return false;
  };

  $("#contact-link").click(function() {
    $("#first_name_input").focus();
  });
  $(".modal").each(function() {
    $(this).appendTo('body');
  });


$('h4 a[data-toggle="collapse"]').parent().addClass('inactive');
$('#accordion h4 a[data-toggle="collapse"]').on('click', function(e) {
    if($(this).parent().hasClass('inactive')) {
        $('#accordion h4').removeClass('active').addClass('inactive');
        $(this).parent().removeClass('inactive');
        $(this).parent().addClass('active');
    }
    else {
        $(this).parent().removeClass('active');
        $(this).parent().addClass('inactive');
    }
});


});

$(function() {
  $(window).on('scroll',function(){
    var WindowTop = $(window).scrollTop();
    $('section').each(function(i){
      if(WindowTop > $(this).offset().top - 50 && WindowTop < $(this).offset().top + $(this).outerHeight(true)){
        $('.nav > li > a').removeClass('active');
        $('.nav li').eq(i).find('a').addClass('active');
      } else if ($(window).scrollTop() == 0) {
        $('.nav > li > a').removeClass('active');
      }
    });
  });
  $('.nav > li > a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});







