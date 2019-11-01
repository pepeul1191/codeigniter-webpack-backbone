const showLoader = function(){
  if(!FIRST_LOAD){
    setTimeout(function(){
      $('.preloader').css('display', ''); 
    }, 250);
    $('.preloader').css('background', '#FDFDFD'); 
    $('.wrapper').css('display', 'block'); 
    $('.preloader').css('z-index', 1000000); 
    $('.preloader').addClass('complete');
  }
}

export default showLoader;