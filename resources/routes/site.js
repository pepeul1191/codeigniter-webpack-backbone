import hideLoader from '../helpers/hide_loader';
import showLoader from '../helpers/show_loader';
import SiteHomeView from '../views/site/home_view';
import SiteContactoView from '../views/site/contacto_view';
import SiteOdontologosView from '../views/site/odontologos_view';
import SiteSedeDetalleView from '../views/site/sede_detalle_view';

var SiteRouter = Backbone.Router.extend({
  workspace: '#workspace',
  homeView: null,
  contactoView: null,
  odontologosView: null,
  sedeDetalleView: null,
  initialize: function() {
    this.contactoView = new SiteContactoView();
  },
  routes:{
    [SPA_PATH + '']: 'index',
    [SPA_PATH + '/']: 'index',
    [SPA_PATH +'contacto']: 'contacto',
    [SPA_PATH + 'odontologos']: 'odontologos',
    [SPA_PATH + 'sedes/:branchType/:branchName']: 'sedeBranch',
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
      $(_this.workspace).removeClass('workpace-inner');
      $('nav').removeClass('primary');
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
      this.odontologosView.loadComponents();
      hideLoader();
      // render contacto?
      if(!_this.contactoView.rendered){
        _this.contactoView.render();
        _this.contactoView.rendered = true;
      }
      $(_this.workspace).addClass('workpace-inner');
      $('nav').addClass('primary');
      $('.parallax').parallax();
      $('select').formSelect();
    }, 1000);
  },
  sedeBranch: function(branchType, branchName){
    var _this = this;
    showLoader();
    setTimeout(function(){
      if(this.sedeDetalleView == null){
        this.sedeDetalleView = new SiteSedeDetalleView();
      }
      this.sedeDetalleView.render(branchType, branchName); 
      this.sedeDetalleView.loadComponents();
      hideLoader();
      // render contacto?
      if(!_this.contactoView.rendered){
        _this.contactoView.render();
        _this.contactoView.rendered = true;
      }
      $(_this.workspace).addClass('workpace-inner');
      $('nav').addClass('primary');
      $('.parallax').parallax();
      $('select').formSelect();
    }, 1000);
  },
  default: function(path){
    // console.log(path);
    var newURL = '/' + path;
    window.location = newURL;
    return fasle;
  },
});

export default SiteRouter;