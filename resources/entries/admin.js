import 'bootstrap/dist/css/bootstrap.min.css';
import '../../public/assets/css/admin.css';


$(document).ready(function(){
  var Carrer = Backbone.Model.extend({
    initialize : function() {
      this.id = null;
      this.name = null;
    }
  });
  var c = new Carrer();
  console.log(c)
  alert("document ready occurred!");
});