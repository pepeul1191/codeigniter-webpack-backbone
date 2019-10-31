import hideLoader from '../helpers/hide_loader';
import showLoader from '../helpers/show_loader';
import SiteHomeView from '../views/site/home_view';

var SiteRouter = Backbone.Router.extend({
  homeView: null,
  initialize: function() {
  },
  routes:{
    '': 'index',
    // others
    '*path' : 'default',
  },
  index: function(){
    showLoader();
    setTimeout(function(){
      if(this.homeView == null){
        this.homeView = new SiteHomeView();
      }
      this.homeView.render(); 
      hideLoader();
    }, 1000);
  },
  default: function(path){
    // console.log(path);
    var newURL = '/' + path;
    window.location = newURL;
  },
});

export default SiteRouter;