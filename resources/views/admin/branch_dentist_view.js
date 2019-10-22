import Table from '../../libs/table';
import Dentist from '../../models/dentist';
import DentistCollection from '../../collections/dentist_collection';

var AdminBranchDentistView = Backbone.View.extend({
  el: '#workspace',
  branch_id: null,
  dentistTable: null,
	initialize: function(){
	},
	events: {
    'keyup #dentistTable > tbody > tr > td > input.text-autocomplete': 'autocompleteDentist',
    'click #dentistTable > tbody > tr > td > .hint-container': 'clickHint',
    'click #dentistTable > tfoot > tr > td > button.add-row': 'addRowDentist',
    'click #dentistTable > tfoot > tr > td > button.save-table': 'saveTableDentist',
    'click #dentistTable > tbody > tr > td > i.delete': 'deleteRowDentist',
  },
  render: function(data, type){
		var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/admin/branch_dentist.html',
		  type: 'GET',
		  async: false,
		  success: function(resource) {
        var template = _.template(resource);
        templateCompiled = template(data);
      },
      error: function(xhr, status, error){
        console.error(error);
				console.log(JSON.parse(xhr.responseText));
      }
		});
		this.$el.html(templateCompiled);
  },
  loadComponents: function(){
    var _this = this;
    // dentistTable
    this.dentistTable = new Table({
      el: 'dentistTable', // String
      messageLabelId: 'message', // String
      model: Dentist, // String
      collection: new DentistCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/branch/dentist?branch_id=' + _this.branch_id, // String
        save: BASE_URL + 'admin/branch/dentist/save', // String
      },
      extraData: null,
      observer: { // not initialize
      new: [],
      edit: [],
      delete: [],
      },
      messages: {
        list500: 'Ocurrió un error no esperado en listar los odontólogos de la sede',
        list501: 'Ocurrió un error en listar los odontólogos de la sede',
        list404: 'Recurso no encontrado - listar odontólogos de sede',
        save500: 'Ocurrió un error no esperado en grabar los cambios',
        save501: 'Ocurrió un error en grabar los cambios',
        save404: 'Recurso no encontrado - guardar  odontólogos de sede',
        save200: 'Odontólogos de sede actualizados',
      },
      serverKeys: ['id', 'dentist_id',],
      row: {
        table: ['id', 'dentist_id',],
        tds: [
          { // id
            type: 'tdId',
            styles: 'display: none; ', 
            edit: false,
            key: 'id',
          },
          { // dentists
            type: 'autocomplete',
            styles: '', 
            edit: true,
            key: 'name',
            service: {
              url: BASE_URL + 'admin/dentist/search',
              param: 'name',
            },
            formatResponseData: {
              id: 'id',
              name: 'name',
            },
            keyModel: 'dentist_id',
            keyName: 'name',
          },
        ],
        buttons: [
          {
            type: 'i',
            operation: 'delete',
            class: 'fa-times',
            styles: 'padding-left: 30px;',
          },
        ],
      },
    });
    this.dentistTable.list();
    this.dentistTable.extraData = {
      branch_id: _this.branch_id
    };
  },
  autocompleteDentist: function(event){
    this.dentistTable.keyUpAutocomplete(event);
  },
  clickHint: function(event){
    this.dentistTable.clickHint(event);
  },
  saveTableDentist: function(event){
    if(this.branch_id != 'E'){
      this.dentistTable.extraData = {
        branch_id: parseInt(this.branch_id),
      };
      this.dentistTable.saveTable(event);
    }else{
      $('#message').removeClass('alert-success');
      $('#message').removeClass('alert-warning');
      $('#message').addClass('alert-danger');
      $('#message').html('Debe registrar la sede primero');
    }    
  },
  addRowDentist: function(event){
    this.dentistTable.addRow(event);
  },
  deleteRowDentist: function(event){
    this.dentistTable.deleteRow(event);
  },
});

export default AdminBranchDentistView;