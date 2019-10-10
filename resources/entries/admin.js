/*
import '../../public/assets/css/styles.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/js/dist/dropdown';
import 'bootstrap/js/dist/collapse';
import 'bootstrap/js/dist/modal';


var router = new AdminRouter();



$(document).ready(function(){
  // alert("document ready occurred!");
  Backbone.history.start({
    pushState: true, 
    root: '/admin/',
  });
});

$('body').on("click", 'a[href^="/"]', function(evt) {
  evt.preventDefault();
  router.navigate($(this).attr('href'), {trigger: true});
});

*/

import 'bootstrap/dist/css/bootstrap.min.css';
import '../../public/assets/css/admin.css';
import '../../public/assets/css/autocomplete.css';
import '../../public/assets/css/table.css';
import AdminRouter from '../routes/admin';
alert();
