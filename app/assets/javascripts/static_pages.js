// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $(window).on("scroll", function() {
    if($(window).scrollTop() > 50) {
      $(".header-inverse").css("background-color", "#000");
    } else {
      $(".header-inverse").css("background-color", "rgba(0,0,0,0)");
    }
  });

  $('.nav li a').click(function () {
    $('.navbar-collapse').removeClass("in");
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

// function initVideos(){

//     if ($('.player').length) {
//       $('.player').each(function(index, el) {
//         $(el).mb_YTPlayer({
//           autoPlay: true,
//           mute: true,
//         });
//       });

//       if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
//         $('.video-container').append('<div class="fallback-bg"></div>');
//         $('#fallback-bg').css('background-image', 'url('+$('.video-container').data('fallback-bg')+')');
//       }

//       if ($('.video-container').length > 1) {
//         $('.video-container').css('position', 'absolute');
//       }

//       $('.video-container').each(function(index, el) {
//         if ($(el).closest('section').find('#home-slider').length) {
//           $(el).closest('section').find('#home-slider').css('background-color', 'transparent');
//         }
//       });


//     }

//     var videoEl = $('.video-container>video');

//     var setProportion = function () {
//       var proportion = getProportion();
//       videoEl.width(proportion*1280);
//       videoEl.height(proportion*780);

//       centerVideo();
//     }

//     var getProportion = function () {
//       var windowWidth = $(window).width();
//       var windowHeight = $(window).height();
//       var windowProportion = windowWidth / windowHeight;
//       var origProportion = 1280 / 720;
//       var proportion = windowHeight / 720;

//       if (windowProportion >= origProportion) {
//         proportion = windowWidth / 1280;
//       }

//       return proportion;
//     }

//     var centerVideo = function() {
//       var centerX = (($(window).width() >> 1) - (videoEl.width() >> 1)) | 0;
//       var centerY = (($(window).height() >> 1) - (videoEl.height() >> 1)) | 0;

//       videoEl.css({ 'left': centerX, 'top': centerY });

//     }

//     if (videoEl.length) {
//       $(window).resize(function() {
//         setProportion();
//       }).trigger('resize');
//     }
//   }

// initVideos();










