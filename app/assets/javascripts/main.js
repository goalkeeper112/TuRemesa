
/*
  [Master JavaScript file]

  Project:	Fantonica Landing page
  Version:	1.0
  Last change:	16/02/15
  Author:	Fantonica team
  Primary use:	Marketing sites

  Used plugins:
    jQuery "http://jquery.com/"
    Bootstrap "http://getbootstrap.com/"
    scrollReveal.js "http://scrollrevealjs.org/"
    Stellar.js "http://markdalgleish.com/projects/stellar.js/"
    Baguettebox.js "http://feimosi.github.io/baguetteBox.js/"
    SlickSlider.js "http://kenwheeler.github.io/slick/"
 */
var contactForm, headerHeight, init, mailChimp, mapInit, onResize, openMobileMenu;

mapInit = function() {

  /* Initialize google map */
  var location, map, mapOptions, mapType, marker, styles;
  map = null;
  location = new google.maps.LatLng(40.6743890, -73.9455);
  styles = [
    {
      featureType: "all",
      elementType: "all",
      stylers: [
        {
          saturation: -100
        }
      ]
    }
  ];
  mapOptions = {
    zoom: 11,
    center: location,
    scrollwheel: false,
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'fantonica']
    }
  };
  map = new google.maps.Map(document.getElementById("map"), mapOptions);
  mapType = new google.maps.StyledMapType(styles, {
    name: "Grayscale"
  });
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(40.6743890, -73.9455),
    map: map,
    title: 'Some marker'
  });
  map.mapTypes.set('fantonica', mapType);
  return map.setMapTypeId('fantonica');
};

openMobileMenu = function() {

  /* Initialize mabile menu */
  return $('.open-mobile-menu').on('click', function(e) {
    e.stopPropagation();
    if ($('.nav').hasClass('menu-opened')) {
      return $('.nav').removeClass('menu-opened');
    } else {
      $('.nav').addClass('menu-opened');
      return $(document).one('click', function() {
        return $('.nav').removeClass('menu-opened');
      });
    }
  });
};

$.fn.smoothMenu = function() {

  /* Initialize smooth scroll navigation */
  var sections, self, updateActive;
  self = this;
  this.on("click", function(e) {
    var target;
    e.preventDefault();
    target = $(this.getAttribute('href'));
    if (target.length) {
      return $('body, html').animate({
        scrollTop: target.offset().top
      }, 1000);
    }
  });
  sections = $('.section, .sub-section, .header, .container');
  updateActive = function() {
    var nav, section, _i, _len;
    for (_i = 0, _len = sections.length; _i < _len; _i++) {
      section = sections[_i];
      if (window.scrollY > section.offsetTop - 100 && window.scrollY < (section.offsetTop + section.clientHeight)) {
        nav = self.filter(".nav [href='#" + section.id + "']");
        if (!nav.hasClass('active')) {
          nav.addClass('active').parent().siblings().find('a').removeClass('active');
        }
      }
    }
    return requestAnimationFrame(updateActive);
  };
  return updateActive();
};

onResize = function() {};

headerHeight = function() {
  var height;
  height = $('.top-bar').height();
  $('.header:not(.full-page)').css({
    marginTop: $('.top-bar').height()
  });
  $('.header.full-page').css({
    height: $(window).height()
  });
  if (window.scrollY > height) {
    $('.top-bar').addClass('waypoint');
  } else {
    $('.top-bar').removeClass('waypoint');
  }
  $('.full-width-slider').find('.slide > img').each(function(i, item) {
    return $(item).css({
      marginLeft: -($(item).width() - $(window).width()) / 2
    });
  });
  return requestAnimationFrame(headerHeight);
};

mailChimp = function() {
  return $('.subscribe').each(function(i, form) {
    var action;
    if (action = $(form).attr('action')) {
      return $(form).ajaxChimp({
        url: action,
        callback: function(res) {
          $(form).find('.alert').removeClass('alert-success alert-danger');
          if (res.result === "success") {
            $(form).find('.alert').html(res.msg).addClass('alert-success');
          }
          if (res.result === "error") {
            return $(form).find('.alert').html(res.msg).addClass('alert-danger');
          }
        }
      });
    }
  });
};

contactForm = function() {
  return $('.contacts').on('submit', function(e) {
    e.preventDefault();
    console.log(e);
    return $.ajax({
      type: "post",
      url: "sendmail.php",
      data: $(this).serializeArray(),
      success: (function(_this) {
        return function(data) {
          return $(_this).find('.alerts-wrap').append('<div class="alert alert-success alert-dismissible"> <button type="button" data-dismiss="alert" aria-label="Close" class="close"><span aria-hidden="true">×</span></button> <p>Message sent successfully</p> </div>');
        };
      })(this)
    });
  });
};

init = function() {

  /* Initialize all plugins after window load */
  $('.site-wrapper').addClass('in');
  mapInit();
  openMobileMenu();
  headerHeight();
  mailChimp();
  contactForm();
  $(window).trigger('resize');
  $('.smooth-scrolling').smoothMenu();
  $('.flexslider').flexslider({
    animation: "fade",
    animationSpeed: 1000,
    slideshow: false,
    prevText: '<i class="fa fa-angle-left"></i>',
    nextText: '<i class="fa fa-angle-right"></i>'
  });
  window.sr = new scrollReveal({
    easing: 'hustle',
    mobile: true
  });
  $('.image-slider').slick({
    arrows: false,
    dots: true,
    adaptiveHeight: true
  });
  $('.thumb-slider').slick({
    arrows: false,
    dots: true,
    slidesToShow: 4,
    slidesToScroll: 4,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3
        },
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        },
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
  $('.testimonials-slider').slick({
    arrows: false,
    dots: true,
    slidesToShow: 2,
    slidesToScroll: 2,
    responsive: [
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
  baguetteBox.run('.gallery', {});
  return $.stellar({
    responsive: true
  });
};

$(window).on('resize', onResize);

$(window).on('load', function() {
  setTimeout(init, 1000);
  $('.loader').addClass('up');
  return $('body').removeClass('no-scroll');
});
