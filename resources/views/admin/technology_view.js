import Table from '../../libs/table';
import TechnologyCollection from '../../collections/technology_collection';
import Technology from '../../models/technology';

var AdminTechnologyView = Backbone.View.extend({
  el: '#workspace',
  system_id: null,
  technologyTable: null,
	initialize: function(){
	},
	events: {
    'click #technologyTable > tfoot > tr > td > button.save-table': 'saveTableTechnology',
    'click #technologyTable > tbody > tr > td > i.delete': 'deleteRowTechnology',
  },
  render: function(){
		var data = {};
		var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/admin/technology.html',
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
    this.technologyTable = new Table({
      el: 'technologyTable', // String
      messageLabelId: 'message', // String
      model: Technology, // String
      collection: new TechnologyCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/technology/list', // String
        save: BASE_URL + 'admin/technology/save', // String
      },
      extraData: null,
      observer: { // not initialize
      new: [],
      edit: [],
      delete: [],
      },
      messages: {
        list500: 'Ocurrió un error no esperado en listar las tecnologías',
        list501: 'Ocurrió un error en listar las tecnologías',
        list404: 'Recurso no encontrado - listar tecnologías',
        save500: 'Ocurrió un error no esperado en grabar las cambios',
        save501: 'Ocurrió un error en grabar las cambios',
        save404: 'Recurso no encontrado - guardar tecnologías',
        save200: 'Tecnologías actualizadas',
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
            type: 'td',
            styles: 'padding-left:20px;', 
            edit: true,
            key: 'name',
          },
        ],
        buttons: [
          {
            type: 'a',
            operation: '',
            class: 'fa-pencil',
            styles: 'padding-left: 0px;',
            url: '/technologies/edit/{0}',
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
    });
    this.technologyTable.list();
  },
  deleteRowTechnology: function(event){
    this.technologyTable.deleteRow(event);
  },
  saveTableTechnology: function(event){
    this.technologyTable.saveTable(event);
  },
});

export default AdminTechnologyView;