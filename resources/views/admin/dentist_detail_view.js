import Table from '../../libs/table';
import Upload from '../../libs/upload';
import ValidationForm from '../../libs/validation_form';
import DentistService from '../../services/admin/dentist_service';
import Dentist from '../../models/dentist';
import Image from '../../models/image';
import SpecialismCollection from '../../collections/specialism_collection';
import Specialism from '../../models/specialism';

var AdminDentistDetailView = Backbone.View.extend({
  el: '#workspace',
  system_id: null,
  specialimsTable: null,
  branchTable: null,
  upload: null,
  form: null,
  dentist: null,
	initialize: function(){
    this.dentist = new Dentist();
	},
	events: {
    // upload
    'click #btnSave': 'save',
    'click #btnViewPicture': 'viewPicture',
    // specialimsTable
    'click #specialimsTableSave': 'saveSpecialimsTable',
    'change #specialimsTable > tbody > tr > td > input.input-check': 'clickCheckBoxSpecialimsTable',
    // branchTable autcomplete
    'keyup #branchTable > tbody > tr > td > input.text-autocomplete': 'autocompleteBranch',
    'click #branchTable > tbody > tr > td > .hint-container': 'clickHint',
    'click #branchTable > tfoot > tr > td > button.add-row': 'addRowBranch',
    'click #branchTable > tfoot > tr > td > button.save-table': 'saveTableBranch',
    'click #branchTable > tbody > tr > td > i.delete': 'deleteRowBranch',
  },
  render: function(data, type){
    this.dentist.unSet();
    if(type == 'new'){
      data.model = this.dentist;
      data.disabled = false;
      data.message = '';
      data.messageClass = '';
    }else{ // is edit, set model from server
      var respData = DentistService.getDetail(data.id);
      if(respData.status == 200){
        this.dentist.set('id', data.id);
        this.dentist.set('name', respData.message.name);
        this.dentist.set('cop', respData.message.cop);
        this.dentist.set('rne', respData.message.rne);
        this.dentist.set('image', respData.message.image);
        data.model = this.dentist;
        data.disabled = false;
        data.message = '';
        data.messageClass = '';
      }else if(respData.status == 404){
        data.message = 'Recurso que busca no encontrado';
        data.messageClass = 'alert-warning';
      }else if(respData.status == 501){
        data.message = 'Ocurrió un error controlado al recuperar los datos del odontólogo a editar';
      }else{
        data.message = 'Ocurrió un error no controlado al recuperar los datos del odontólogo a editar';
      }
    }
    data.model = this.dentist;
    // template
		var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/admin/dentist_detail.html',
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
    // upload
    this.upload = new Upload({
      el: '#uploadForm',
      inputFile: 'filePicture',
      helpText: 'message',
      buttonChoose: 'btnSelectPicture',
      buttonUpload: 'btnUploadPicture',
      img: 'imgPicture',
      service: {
        url: BASE_URL + 'upload/file',
        formDataKey: 'file',
        uploadMessage: 'Subiendo archivo...',
        errorMessage: 'Ocurrió un error en subir el archivo',
        successMessage: 'Carga completada'
      },
      statusClasses: { // bootstrap classes by default
        success: 'alert-success',
        warning: 'alert-warning',
        danger: 'alert-danger',
      },
      extensions:{
        allow: ['image/jpeg', 'image/png', 'image/jpg'],
        message: 'Formato no válido',
      },
      size:{
        allow: 600000,
        message: 'Archivo supera el máximo permitido',
      },
    });
    // form
    this.form = new ValidationForm({
      el: '#form',
      entries: [
        // name
        {
          id: 'txtName',
          help: 'txtNameHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar el nombre del odontólogo',
            }, 
          ],
        },
        // cop
        {
          id: 'txtCop',
          help: 'txtCopHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar el número COP del odontólogo',
            }, 
          ],
        },
        // picture
        {
          id: 'filePicture',
          help: 'txtPictureHelp',
          validations: [
            {
              type: 'customFunction',
              message: 'Carrera repetida',
              customFunction: function(){
                var resp = true;
                if(_this.upload.image == ''){
                  resp = false;
                }
                return resp;
              },
            },
          ],
        },
      ],
      classes: {
        textDanger: 'text-danger',
        inputInvalid: 'is-invalid',
        textSuccess: 'text-success',
      },
      messageForm: 'message',
    });
    // specialimsTable
    this.specialimsTable = new Table({
      el: 'specialimsTable', // String
      messageLabelId: 'message', // String
      model: Specialism, // String
      collection: new SpecialismCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/dentist/specialism/list', // String
        save: BASE_URL + 'admin/dentist/specialism/save', // String
      },
      extraData: null,
      observer: { // not initialize
      new: [],
      edit: [],
      delete: [],
      },
      messages: {
        list500: 'Ocurrió un error no esperado en listar las especialidades',
        list501: 'Ocurrió un error en listar las especialidades',
        list404: 'Recurso no encontrado - listar especialidades',
        save500: 'Ocurrió un error no esperado en grabar los cambios',
        save501: 'Ocurrió un error en grabar los cambios',
        save404: 'Recurso no encontrado - guardar especialidades',
        save200: 'Especialdiades del odontólogo actualizadas',
      },
      serverKeys: ['id', 'name', 'exist'],
      row: {
        table: ['id', 'name', 'exist'],
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
          { // exist
            type: 'check',
            styles: 'margin-left: 30px;', 
            edit: true,
            key: 'exist',
            values: {
              yes: 1,
              no: 0,
            },
          },
        ],
        buttons: [],
      },
    });
    // branchTable
    this.branchTable = new Table({
      el: 'branchTable', // String
      messageLabelId: 'message', // String
      model: Specialism, // String
      collection: new SpecialismCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/dentist/branch/list', // String
        save: BASE_URL + 'admin/dentist/branch/save', // String
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
        save200: 'Especialdiades del odontólogo actualizadas',
      },
      serverKeys: ['id', 'branch_id',],
      row: {
        table: ['id', 'branch_id',],
        tds: [
          { // id
            type: 'tdId',
            styles: 'display: none; ', 
            edit: false,
            key: 'id',
          },
          { // districts
            type: 'autocomplete',
            styles: '', 
            edit: true,
            key: 'name',
            service: {
              url: BASE_URL + 'admin/branch/search',
              param: 'name',
            },
            formatResponseData: {
              id: 'id',
              name: 'name',
            },
            keyModel: 'branch_id',
            keyName: 'branch_name',
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
  },
  autocompleteBranch: function(event){
    this.branchTable.keyUpAutocomplete(event);
  },
  clickHint: function(event){
    this.branchTable.clickHint(event);
  },
  saveSpecialimsTable: function(event){
    if(this.dentist.get('id') != 'E'){
      this.specialimsTable.extraData = {
        dentist_id: parseInt(this.dentist.get('id')),
      };
      this.specialimsTable.saveTable(event);
    }else{
      $('#message').removeClass('alert-success');
      $('#message').removeClass('alert-warning');
      $('#message').addClass('alert-danger');
      $('#message').html('Debe registrar primero al odontólogo');
    }
  },
  clickCheckBoxSpecialimsTable: function(event){
    this.specialimsTable.clickCheckBox(event);
  },
  saveTableBranch: function(event){
    if(this.dentist.get('id') != 'E'){
      this.branchTable.extraData = {
        dentist_id: parseInt(this.dentist.get('id')),
      };
      this.branchTable.saveTable(event);
    }else{
      $('#message').removeClass('alert-success');
      $('#message').removeClass('alert-warning');
      $('#message').addClass('alert-danger');
      $('#message').html('Debe registrar primero al odontólogo');
    }    
  },
  addRowBranch: function(event){
    this.branchTable.addRow(event);
  },
  deleteRowBranch: function(event){
    this.branchTable.deleteRow(event);
  },
  // ???
  setComponentsData: function(){
    var _this = this;
    this.upload.path = this.dentist.get('image');
    this.upload.url = STATIC_URL;
    this.specialimsTable.services.list = BASE_URL + 'admin/dentist/specialism/list?id=' + this.dentist.get('id');
    this.specialimsTable.list();
    this.specialimsTable.extraData = {
      dentist_id: this.dentist.get('id'),
    };
    this.branchTable.services.list = BASE_URL + 'admin/dentist/branch/list?id=' + this.dentist.get('id');
    this.branchTable.list();
    this.branchTable.extraData = {
      dentist_id: this.dentist.get('id'),
    };
  },
  unSetComponentsData: function(){
    this.upload.path = null;
    this.upload.url = STATIC_URL;
    this.specialimsTable.services.list = BASE_URL + 'admin/dentist/specialism/list?id=0';
    this.specialimsTable.list();
    this.specialimsTable.extraData = {
      dentist_id: this.dentist.get('id'),
    };
    this.branchTable.services.list = BASE_URL + 'admin/dentist/branch/list?id=0';
    this.branchTable.list();
    this.branchTable.extraData = {
      dentist_id: this.dentist.get('id'),
    };
  },
  save: function(){
    this.form.check();
    if(this.form.isOk == true){
      var _this = this;
      this.dentist.set('name', $('#txtName').val());
      this.dentist.set('cop', $('#txtCop').val());
      this.dentist.set('rne', $('#txtRne').val());
      this.dentist.set('image', _this.upload.path);
      var respData = DentistService.saveDetail(this.dentist, 'message');
      if(respData.status == 200){
        if(respData.message == ''){
          // is a edited
        }else{
          // is a created, change title and set modelId
          this.dentist.set('id', respData.message);
          $('#formTitle').html('Editar ondontólogo');
        }
      }
    }
  },
  viewPicture: function(){
    var url = this.upload.url + this.upload.path;
    var win = window.open(url, '_blank');
    win.focus();
  },
});

export default AdminDentistDetailView;