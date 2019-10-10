import AdminSpecialismView from '../views/admin/specialism_view';
import AdminTechnologyView from '../views/admin/technology_view';

var AdminRouter = Backbone.Router.extend({
  specialismView: null,
  initialize: function() {
  },
  routes:{
    '': 'specialisms',
    'specialisms': 'specialisms',
    'technologies': 'technologies',
    // others
    '*path' : 'default',
  },
  index: function(){
    
  },
  specialisms: function(){
    if(this.specialismView == null){
      this.specialismView = new AdminSpecialismView();
    }
    this.specialismView.render();
    this.specialismView.loadComponents();
  },
  technologies: function(){
    if(this.technologyView == null){
      this.technologyView = new AdminTechnologyView();
    }
    this.technologyView.render();
    this.technologyView.loadComponents();
  },
  default: function(path){
    var newURL = '/' + path;
    window.location = newURL;
  },
});

export default AdminRouter;