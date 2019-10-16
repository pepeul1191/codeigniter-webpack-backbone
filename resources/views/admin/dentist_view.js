import Table from '../../libs/table';
import BranchCollection from '../../collections/dentist_collection';
import Branch from '../../models/dentist';

var AdminBranchView = Backbone.View.extend({
  el: '#workspace',
  system_id: null,
  dentistTable: null,
	initialize: function(){
	},
	events: {
    // table departmentTable events
    'click #dentistTable > tbody > tr > td > i.delete': 'deleteRowDentist',
    'keyup #dentistTable > tbody > tr > td > input.text': 'inputTextDentist',
    'click #dentistTable > tfoot > tr > td > button.add-row': 'addRowDentist',
    'click #dentistTable > tfoot > tr > td > button.save-table': 'saveTableDentist',
  },
  render: function(){
		var data = { };
		var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/admin/dentist.html',
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
    this.dentistTable = new Table({
      el: 'dentistTable', // String
      messageLabelId: 'message', // String
      model: Branch, // String
      collection: new BranchCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/branch/list', // String
        save: BASE_URL + 'admin/branch/save', // String
      },
      extraData: null,
      observer: { // not initialize
      new: [],
      edit: [],
      delete: [],
      },
      messages: {
        list500: 'Ocurrió un error no esperado en listar los dentista',
        list501: 'Ocurrió un error en listar los dentista',
        list404: 'Recurso no encontrado - listar dentistas',
        save500: 'Ocurrió un error no esperado en grabar los cambios',
        save501: 'Ocurrió un error en grabar los cambios',
        save404: 'Recurso no encontrado - guardar dentistas',
        save200: 'Dentistas actualizadas',
      },
      serverKeys: ['id', 'name'],
      row: {
        table: ['id', 'name'],
        tds: [
          { // id
            type: 'tdId',
            styles: 'display: none; ', 
            edit: false,
            key: 'id',
          },
          { // namne
            type: 'input[text]',
            styles: '', 
            edit: true,
            key: 'name',
          },
        ],
        buttons: [
          {
            type: 'i',
            operation: 'delete',
            class: 'fa-times',
            styles: 'padding-left: 15px;',
          },
        ],
      },
    });
    this.dentistTable.list();
  },
  deleteRowDentist: function(event){
    this.dentistTable.deleteRow(event);
  },
  inputTextDentist: function(event){
    this.dentistTable.keyUpInputText(event);
  },
  addRowDentist: function(event){
    this.dentistTable.addRow(event);
  },
  saveTableDentist: function(event){
    this.dentistTable.saveTable(event);
  },
});

export default AdminBranchView;