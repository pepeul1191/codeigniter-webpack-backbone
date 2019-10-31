import '../../public/assets/site/css/constants.css';
import '../../public/assets/site/css/megamenumat.css';
import '../../public/assets/site/css/preloader.css';
import '../../public/assets/site/css/styles.css';
import '../../public/assets/site/css/home.css';
import 'materialize-css/dist/js/materialize.min.js';
import 'webpack-jquery-ui/effects';
import SiteRouter from '../routes/site';

var router = new SiteRouter();

$(document).ready(function(){
  // backbone app
  Backbone.history.start({
    pushState: true, 
    root: '/',
  });
  // navbar scrool
  $(window).scroll(function(event){
    var sc = $(window).scrollTop();
    // console.log(sc);
    if(sc >= 650){
      $('nav').addClass('primary', 1000);
      $('nav').addClass('nav-no-shadow', 1000);
      $('menu').addClass('menu-top', 1000);
    }else{
      $('nav').removeClass('primary', 1000);
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
