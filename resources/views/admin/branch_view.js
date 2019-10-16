import Table from '../../libs/table';
import BranchCollection from '../../collections/branch_collection';
import Branch from '../../models/branch';

var AdminBranchView = Backbone.View.extend({
  el: '#workspace',
  system_id: null,
  branchTable: null,
	initialize: function(){
	},
	events: {
    // table departmentTable events
    'click #branchTable > tbody > tr > td > i.delete': 'deleteRowBranch',
    'keyup #branchTable > tbody > tr > td > input.text': 'inputTextBranch',
    'click #branchTable > tfoot > tr > td > button.add-row': 'addRowBranch',
    'click #branchTable > tfoot > tr > td > button.save-table': 'saveTableBranch',
  },
  render: function(){
    var today = new Date();
    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var dateTime = date+' '+time;
		var data = { 
      message: dateTime,
    };
		var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/admin/branch.html',
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
    this.branchTable = new Table({
      el: 'branchTable', // String
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
        list500: 'Ocurrió un error no esperado en listar las sedes',
        list501: 'Ocurrió un error en listar las sedes',
        list404: 'Recurso no encontrado - listar sedes',
        save500: 'Ocurrió un error no esperado en grabar los cambios',
        save501: 'Ocurrió un error en grabar los cambios',
        save404: 'Recurso no encontrado - guardar sedes',
        save200: 'Sedes actualizadas',
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
    this.branchTable.list();
  },
  deleteRowBranch: function(event){
    this.branchTable.deleteRow(event);
  },
  inputTextBranch: function(event){
    this.branchTable.keyUpInputText(event);
  },
  addRowBranch: function(event){
    this.branchTable.addRow(event);
  },
  saveTableBranch: function(event){
    this.branchTable.saveTable(event);
  },
});

export default AdminBranchView;