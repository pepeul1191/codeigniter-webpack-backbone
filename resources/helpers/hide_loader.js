const hideLoader = function(){
  $('.preloader').addClass('complete');
  setTimeout(function(){
    $('.preloader').css('background', 'transparent'); 
    $('.wrapper').css('display', 'none'); 
    $('.preloader').css('z-index', 0); 
  }, 250);
  setTimeout(function(){
    $('.preloader').css('display', 'none'); 
  }, 1000);
  if(FIRST_LOAD){
    FIRST_LOAD = false;
    setTimeout(function(){
      $('.wrapper').addClass('loading');
      $('.wrapper > img').attr('src', '/public/assets/site/img/loading.gif');
    }, 2000);
  }
}

export default hideLoader;