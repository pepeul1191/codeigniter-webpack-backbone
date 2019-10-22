import Table from '../../libs/table';
import BranchCollection from '../../collections/branch_collection';
import Branch from '../../models/branch';

var AdminBranchView = Backbone.View.extend({
  el: '#workspace',
  system_id: null,
  branchTableLima: null,
  branchTableProvince: null,
	initialize: function(){
	},
	events: {
    // table departmentTableLima events
    'click #branchTableLima > tbody > tr > td > i.delete': 'deleteRowBranchLima',
    'click #branchTableLima > tfoot > tr > td > button.add-row': 'addRowBranchLima',
    'click #branchTableLima > tfoot > tr > td > button.save-table': 'saveTableBranchLima',
    // table departmentTableProvince events
    'click #branchTableProvince > tbody > tr > td > i.delete': 'deleteRowBranchProvince',
    'click #branchTableProvince > tfoot > tr > td > button.add-row': 'addRowBranchProvince',
    'click #branchTableProvince > tfoot > tr > td > button.save-table': 'saveTableBranchProvince',
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
    // branchTableLima
    this.branchTableLima = new Table({
      el: 'branchTableLima', // String
      messageLabelId: 'message', // String
      model: Branch, // String
      collection: new BranchCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/branch/list?branch_type_id=1', // String
        save: BASE_URL + 'admin/branch/delete', // String
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
      serverKeys: ['id', 'name', 'address'],
      row: {
        table: ['id', 'name', 'address'],
        tds: [
          { // id
            type: 'tdId',
            styles: 'display: none; ', 
            edit: false,
            key: 'id',
          },
          { // namne
            type: 'td',
            styles: '', 
            edit: true,
            key: 'name',
          },
          { // address
            type: 'td',
            styles: '', 
            edit: true,
            key: 'address',
          },
        ],
        buttons: [
          {
            type: 'a',
            operation: '',
            class: 'fa-pencil',
            styles: 'padding-left: 0px;',
            url: '/branch/edit/{0}',
            keysFormat: ['id', 'names', ],
          },
          {
            type: 'a',
            operation: '',
            class: 'fa-list',
            styles: 'padding-left: 0px;',
            url: '/branch/{0}/dentists', 
            keysFormat: ['id', 'names', ],
          },
          {
            type: 'i',
            operation: 'delete',
            class: 'fa-times',
            styles: 'padding-left: 5px;',
          },
        ],
      },
    });
    this.branchTableLima.list();
    // branchTableProvince
    this.branchTableProvince = new Table({
      el: 'branchTableProvince', // String
      messageLabelId: 'message', // String
      model: Branch, // String
      collection: new BranchCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/branch/list?branch_type_id=2', // String
        save: BASE_URL + 'admin/branch/delete', // String
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
      serverKeys: ['id', 'name', 'address'],
      row: {
        table: ['id', 'name', 'address'],
        tds: [
          { // id
            type: 'tdId',
            styles: 'display: none; ', 
            edit: false,
            key: 'id',
          },
          { // namne
            type: 'td',
            styles: '', 
            edit: true,
            key: 'name',
          },
          { // address
            type: 'td',
            styles: '', 
            edit: true,
            key: 'address',
          },
        ],
        buttons: [
          {
            type: 'a',
            operation: '',
            class: 'fa-pencil',
            styles: 'padding-left: 0px;',
            url: '/branch/edit/{0}',
            keysFormat: ['id', 'names', ],
          },
          {
            type: 'a',
            operation: '',
            class: 'fa-list',
            styles: 'padding-left: 0px;',
            url: '/branch/{0}/dentists', 
            keysFormat: ['id', 'names', ],
          },
          {
            type: 'i',
            operation: 'delete',
            class: 'fa-times',
            styles: 'padding-left: 5px;',
          },
        ],
      },
    });
    this.branchTableProvince.list();
  },
  // branchTableLima
  deleteRowBranchLima: function(event){
    this.branchTableLima.deleteRow(event);
  },
  addRowBranchLima: function(event){
    this.branchTableLima.addRow(event);
  },
  saveTableBranchLima: function(event){
    this.branchTableLima.saveTable(event);
  },
  // branchTableProvince
  deleteRowBranchProvince: function(event){
    this.branchTableProvince.deleteRow(event);
  },
  addRowBranchProvince: function(event){
    this.branchTableProvince.addRow(event);
  },
  saveTableBranchProvince: function(event){
    this.branchTableProvince.saveTable(event);
  },
});

export default AdminBranchView;