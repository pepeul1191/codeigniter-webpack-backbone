import AdminSpecialismView from '../views/admin/specialism_view';
import AdminTechnologyView from '../views/admin/technology_view';
import AdminTechnologyDetailView from '../views/admin/technology_detail_view';

var AdminRouter = Backbone.Router.extend({
  specialismView: null,
  technologyView: null,
  technologyDetailView: null,
  initialize: function() {
  },
  routes:{
    '': 'specialisms',
    'specialisms': 'specialisms',
    'technologies': 'technologies',
    'technologies/new': 'technologiesNew',
    'technologies/edit/:id': 'technologiesEdit',
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
  technologiesNew: function(){
    if(this.technologyDetailView == null){
      this.technologyDetailView = new AdminTechnologyDetailView();
    }
    var data = {
      title: 'Crear Tecnología',
    };
    var type = 'new';
    this.technologyDetailView.render(data, type);
    this.technologyDetailView.loadComponents();
  },
  technologiesEdit: function(id){
    if(this.technologyDetailView == null){
      this.technologyDetailView = new AdminTechnologyDetailView();
    }
    var data = {
      title: 'Editar Tecnología',
    };
    var type = 'edit';
    this.technologyDetailView.render(data, type);
    this.technologyDetailView.loadComponents();
  },
  default: function(path){
    var newURL = '/' + path;
    window.location = newURL;
  },
});

export default AdminRouter;