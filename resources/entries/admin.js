import '../../public/assets/css/admin.css';
import '../../public/assets/css/table.css';
import '../../public/assets/css/autocomplete.css';
import AdminRouter from '../routes/admin';

var router = new AdminRouter();

$(document).ready(function(){
  // alert("document ready occurred!");
  Backbone.history.start({
    pushState: true, 
    root: '/admin/',
  });
});

$('body').on('click', 'a[href^="/"]', function(evt) {
  evt.preventDefault();
  router.navigate($(this).attr('href'), {trigger: true});
});