import hideLoader from '../helpers/hide_loader';
import showLoader from '../helpers/show_loader';
import SiteHomeView from '../views/site/home_view';
import SiteContactoView from '../views/site/contacto_view';
import SiteOdontologosView from '../views/site/odontologos_view';

var SiteRouter = Backbone.Router.extend({
  homeView: null,
  contactoView: null,
  odontologosView: null,
  initialize: function() {
    this.contactoView = new SiteContactoView();
  },
  routes:{
    [SPA_PATH + '']: 'index',
    [SPA_PATH + '/']: 'index',
    ['contacto']: 'contacto',
    ['odontologos']: 'odontologos',
    // others
    '*path' : 'default',
  },
  index: function(){
    var _this = this;
    showLoader();
    setTimeout(function(){
      if(this.homeView == null){
        this.homeView = new SiteHomeView();
      }
      this.homeView.render(); 
      hideLoader();
      // render contacto?
      if(!_this.contactoView.rendered){
        _this.contactoView.render();
        _this.contactoView.rendered = true;
      }
    }, 1000);
  },
  contacto: function(){
    $('html, body').animate({ 
      scrollTop: $('footer').offset().top 
    }, 1000);
  },
  odontologos: function(){
    var _this = this;
    showLoader();
    setTimeout(function(){
      if(this.odontologosView == null){
        this.odontologosView = new SiteOdontologosView();
      }
      this.odontologosView.render(); 
      hideLoader();
      // render contacto?
      if(!_this.contactoView.rendered){
        _this.contactoView.render();
        _this.contactoView.rendered = true;
      }
    }, 1000);
  },
  default: function(path){
    // console.log(path);
    var newURL = '/' + path;
    window.location = newURL;
  },
});

export default SiteRouter;