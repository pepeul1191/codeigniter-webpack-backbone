import AdminSpecialismView from '../views/admin/specialism_view';
import AdminTechnologyView from '../views/admin/technology_view';
import AdminTechnologyDetailView from '../views/admin/technology_detail_view';
import AdminBranchView from '../views/admin/branch_view';
import AdminBranchDetailView from '../views/admin/branch_detail_view';
import AdminDentistView from '../views/admin/dentist_view';
import AdminDentistDetailView from '../views/admin/dentist_detail_view';

var AdminRouter = Backbone.Router.extend({
  specialismView: null,
  technologyView: null,
  technologyDetailView: null,
  initialize: function() {
  },
  routes:{
    '': 'specialisms',
    'specialisms': 'specialisms',
    // techonology
    'technologies': 'technologies',
    'technologies/new': 'technologiesNew',
    'technologies/edit/:id': 'technologiesEdit',
    // branch
    'branches': 'branches',
    'branches/new': 'branchesNew',
    // dentist
    'dentists': 'dentists',
    'dentist/new': 'dentistsNew',
    'dentist/edit/:id': 'dentistsEdit',
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
  // technology
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
      id: 'E',
      messageClass: '',
      disabled: false,
    };
    var type = 'new';
    this.technologyDetailView.render(data, type);
    this.technologyDetailView.loadComponents();
    this.technologyDetailView.unSetComponentsData();
  },
  technologiesEdit: function(id){
    if(this.technologyDetailView == null){
      this.technologyDetailView = new AdminTechnologyDetailView();
    }
    var data = {
      title: 'Editar Tecnología',
      id: id,
      messageClass: 'alert-danger',
      disabled: true,
    };
    var type = 'edit';
    this.technologyDetailView.render(data, type);
    this.technologyDetailView.loadComponents();
    this.technologyDetailView.setComponentsData();
  },
  // branch
  branches: function(){
    if(this.branchView == null){
      this.branchView = new AdminBranchView();
    }
    this.branchView.render();
    this.branchView.loadComponents();
  },
  branchesNew: function(){
    if(this.branchDetailView == null){
      this.branchDetailView = new AdminBranchDetailView();
    }
    var data = {
      title: 'Crear Sede',
      id: 'E',
      messageClass: '',
      disabled: false,
    };
    var type = 'new';
    this.branchDetailView.render(data, type);
    this.branchDetailView.loadComponents();
    this.branchDetailView.unSetComponentsData();
  },
  // denitsts
  dentists: function(){
    if(this.dentistView == null){
      this.dentistView = new AdminDentistView();
    }
    this.dentistView.render();
    this.dentistView.loadComponents();
  },
  dentistsNew: function(){
    if(this.dentistDetailView == null){
      this.dentistDetailView = new AdminDentistDetailView();
    }
    var data = {
      title: 'Gestión de Odontólogo',
      id: 'E',
      messageClass: '',
      disabled: false,
    };
    var type = 'new';
    this.dentistDetailView.render(data, type);
    this.dentistDetailView.loadComponents();
    this.dentistDetailView.unSetComponentsData();
  },
  dentistsEdit: function(id){
    if(this.dentistDetailView == null){
      this.dentistDetailView = new AdminDentistDetailView();
    }
    var data = {
      title: 'Editar Odontólogo',
      id: id,
      messageClass: 'alert-danger',
      disabled: true,
    };
    var type = 'edit';
    this.dentistDetailView.render(data, type);
    this.dentistDetailView.loadComponents();
    this.dentistDetailView.setComponentsData();
  },
  // default
  default: function(path){
    var newURL = '/' + path;
    window.location = newURL;
  },
});

export default AdminRouter;