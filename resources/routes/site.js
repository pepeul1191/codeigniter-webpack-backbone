import hideLoader from '../helpers/hide_loader';
import showLoader from '../helpers/show_loader';
import hideMenu from '../helpers/hide_menu';
import showMenu from '../helpers/show_menu';
import SiteHomeView from '../views/site/home_view';
import SiteContactoView from '../views/site/contacto_view';
import SiteOdontologosView from '../views/site/odontologos_view';
import SiteSedeDetalleView from '../views/site/sede_detalle_view';
import SiteTecnologiaDetalleView from '../views/site/tecnologia_detalle_view';
import MenuView from '../views/site/menu_view';

var SiteRouter = Backbone.Router.extend({
  workspace: '#workspace',
  homeView: null,
  contactoView: null,
  odontologosView: null,
  sedeDetalleView: null,
  menuView: null,
  initialize: function() {
    this.contactoView = new SiteContactoView();
    this.contactoView.loadComponents();
    this.menuView = new MenuView();
  },
  routes:{
    [SPA_PATH + '']: 'index',
    [SPA_PATH + '/']: 'index',
    [SPA_PATH +'agenda-tu-cita']: 'contacto',
    [SPA_PATH + 'odontologos']: 'odontologos',
    [SPA_PATH + 'red/:branchType/:branchName']: 'sedeDetalle',
    [SPA_PATH + 'tecnologias/:technologyName']: 'tecnologiaDetalle',
    // others
    '*path' : 'default',
  },
  index: function(){
    var _this = this;
    showLoader();
    showMenu();
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
    }, 900);
  },
  odontologos: function(){
    var _this = this;
    showLoader();
    hideMenu();
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
    // modal when is in responsive
    $('.modal-overlay').click();
  },
  tecnologiaDetalle: function(technologyName){
    var _this = this;
    showLoader();
    hideMenu();
    setTimeout(function(){
      if(this.tecnologiaDetalleView == null){
        this.tecnologiaDetalleView = new SiteTecnologiaDetalleView();
      }
      this.tecnologiaDetalleView.render(technologyName); 
      this.tecnologiaDetalleView.loadComponents();
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
    // modal when is in responsive
    $('.modal-overlay').click();
  },
  sedeDetalle: function(branchType, branchName){
    var _this = this;
    showLoader();
    hideMenu();
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
    // modal when is in responsive
    $('.modal-overlay').click();
  },
  default: function(path){
    console.log(path);
    var newURL = '/' + path;
    //window.location = newURL;
    return false;
  },
});

export default SiteRouter;