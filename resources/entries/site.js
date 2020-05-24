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
    var pathname = window.location.pathname; 
    if(pathname == '/'){
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
    }
  });
  // materialize js
  $('.sidenav').sidenav();
  $('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true
  });
  $('.modal').modal({
    dismissible: true,
    onCloseEnd: function() { // Callback for Modal close
      document.getElementById('homeVideoModal').pause();   
    } 
  });
  $('select').formSelect();
  // nan-link goes to first link
  $(".link-nav").click(function(event) {
    event.target.nextElementSibling.firstElementChild.children[1].firstElementChild.click();
  });
  // sidenav events
  $('.sidenav-link').click(function(event){
    var link = $(event.target).attr('link');
    if (link == 'contacto'){
      $('html, body').animate({ 
        scrollTop: $('footer').offset().top 
      }, 900);
    }
    if (link == 'red'){
      var html = '<div class="workspace-menu">' + $('#sedesLima').html() + '</div>';
      html = html + '<div class="workspace-menu">' + $('#sedesProvincia').html() + '</div>';
      $('#modalBottom').empty();
      $('#modalBottom').append(html);
      var btnModal = document.getElementById('modal-bottom-btn');
      btnModal.click();
    }
    if (link == 'tecnologia'){
      var html = '<div class="workspace-menu">' + $('#menuTecnologia').html() + '</div>';
      $('#modalBottom').empty();
      $('#modalBottom').append(html);
      var btnModal = document.getElementById('modal-bottom-btn');
      btnModal.click();
    }
    $('.sidenav-overlay').click();
  });
  // cargar modal por coronavirus con carousel
  // $('#modalCoronavirus').modal('open'); 
  $('.collapsible').collapsible();
  $('.carousel').carousel({
    'fullWidth': true, 
    'indicators': true
  });
  autoplay();
  function autoplay() {
    setTimeout(function(){
      $('.carousel').carousel('next');
      setTimeout(autoplay, 6500);
    }, 6500);
  }
});

$('#preguntas').click(function(){
  $('#modalBottom').empty();
  $('#modalBottom').css('max-height', '75%');
  var template = null;
  $.ajax({
    url: STATIC_URL + 'templates/site/_preguntas.html',
    type: 'GET',
    async: false,
    success: function(source) {
      template = source;
    }
  });
  $('#modalBottom').append(template);
  var btnModal = document.getElementById('modal-bottom-btn');
  btnModal.click();
});

$('#terminos-condiciones').click(function(){
  $('#modalBottom').empty();
  $('#modalBottom').css('max-height', '75%');
  var template = null;
	$.ajax({
	   url: BASE_URL + '/modals/terminos-condiciones.html',
	   type: 'GET',
	   async: false,
	   success: function(source) {
	     template = source;
	   }
	});
  $('#modalBottom').append(template);
  var btnModal = document.getElementById('modal-bottom-btn');
  btnModal.click();
});

$('#modalCoronavirus > .x-close > i').click(function(){
  $('#modalCoronavirus').modal('close'); 
});

$('body').on('click', 'a[href^="/"]', function(evt) {
  evt.preventDefault();
  // console.log($(this).attr('href'))
  router.navigate($(this).attr('href'), {trigger: true});
})