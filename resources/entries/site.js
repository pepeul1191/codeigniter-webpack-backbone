import '../../public/assets/css/site.css';
import '../../public/assets/css/megamenumat.css';
import '../../public/assets/css/preloader.css';
import 'materialize-css/dist/js/materialize.min.js';
import 'webpack-jquery-ui/effects';

$(document).ready(function(){
  // preloader
  $('.preloader').addClass('complete');
      setTimeout(function(){
        $('.preloader').css('background', 'transparent'); 
        $('.wrapper').css('display', 'none'); 
        $('.preloader').css('z-index', 0); 
      }, 1000);
  // navbar scrool
  $(window).scroll(function(event){
    var sc = $(window).scrollTop();
    // console.log(sc);
    if(sc >= 650){
      $('nav').addClass('red', 1000);
      $('nav').addClass('nav-no-shadow', 1000);
      $('menu').addClass('menu-top', 1000);
    }else{
      $('nav').removeClass('red', 1000);
      $('nav').removeClass('nav-no-shadow', 1000);
      $('menu').removeClass('menu-top', 1000);
    }
  });
  // materialize js
  $('.sidenav').sidenav();
  $('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true
  });
  $('.modal').modal();
});
