import Table from '../../libs/table';
import DentistCollection from '../../collections/dentist_collection';
import Dentist from '../../models/dentist';

var AdminDentistView = Backbone.View.extend({
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
    // pagination departmentTable
    'click #dentistTable > tfoot > tr > td > #btnGoBegin': 'goBegin',
    'click #dentistTable > tfoot > tr > td > #btnGoPrevious': 'goPrevious',
    'click #dentistTable > tfoot > tr > td > #btnGoNext': 'goNext',
    'click #dentistTable > tfoot > tr > td > #btnGoLast': 'goLast',
    // search params
    'click #btnSearch': 'search',
    'click #btnClean': 'clean',
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
      model: Dentist, // String
      collection: new DentistCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/dentist/list', // String
        save: BASE_URL + 'admin/dentist/delete', // String
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
      serverKeys: ['id', 'name', 'cop', 'rne'],
      row: {
        table: ['id', 'name', 'cop', 'rne'],
        tds: [
          { // id
            type: 'tdId',
            styles: 'display: none; ', 
            edit: false,
            key: 'id',
          },
          { // name
            type: 'td',
            styles: '', 
            edit: true,
            key: 'name',
          },
          { // cop
            type: 'td',
            styles: '', 
            edit: true,
            key: 'cop',
          },
          { // rne
            type: 'td',
            styles: '', 
            edit: true,
            key: 'rne',
          },
        ],
        buttons: [
          {
            type: 'a',
            operation: '',
            class: 'fa-pencil',
            styles: 'padding-left: 0px;',
            url: '/' + SPA_PATH + '/dentist/edit/{0}',
            keysFormat: ['id', 'names', ],
          },
          {
            type: 'i',
            operation: 'delete',
            class: 'fa-times',
            styles: 'padding-left: 15px;',
          },
        ],
      },
      pagination: {
        buttons: {
          next: 'btnGoNext',
          prev: 'btnGoPrevious',
          begin: 'btnGoBegin',
          last: 'btnGoLast',
        },
        service: {
          paramPage: 'page',
          paramStep: 'step',
          respList: 'list',
          respPages: 'pages',
        },
        number: 'pagination',
        step: 20,
        pageActual: 1,
        pageNumber: null,
      },
    });
    this.dentistTable.list();
  },
  deleteRowDentist: function(event){
    this.dentistTable.deleteRow(event);
  },
  saveTableDentist: function(event){
    this.dentistTable.saveTable(event);
  },
  // pagination
  goBegin: function(event){
    this.dentistTable.goBegin();
  },
  goPrevious: function(event){
    this.dentistTable.goPrevious();
  },
  goNext: function(event){
    this.dentistTable.goNext();
  },
  goLast: function(event){
    this.dentistTable.goLast();
  },
  search: function(event){
    // data
    var name = $('#txtName').val();
    var cop = $('#txtCop').val();
    var rne = $('#txtRne').val();
    // build url
    var base = BASE_URL + 'admin/dentist/list?';
    if(name != ''){
      base = base + 'name=' + name + '&';
    }
    if(cop != ''){
      base = base + 'cop=' + cop + '&';
    }
    if(rne != ''){
      base = base + 'rne=' + rne + '&';
    }
    this.dentistTable.services.list = base;
    this.dentistTable.list();
  },
  clean: function(event){
    // data
    $('#txtName').val('');
    $('#txtCop').val('');
    $('#txtRne').val('');
    // build url
    var base = BASE_URL + 'admin/dentist/list?';
    this.dentistTable.services.list = base;
    this.dentistTable.list();
  },
});

export default AdminDentistView;