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
  branchesTable: null,
  upload: null,
  form: null,
  dentist: null,
	initialize: function(){
    this.dentist = new Dentist();
	},
	events: {
    'click #btnSave': 'save',
    'click #btnViewPicture': 'viewPicture',
  },
  render: function(data, type){
    this.dentist.unSet();
    if(type == 'new'){
      data.model = this.branch;
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
    // table
    this.specialimsTable = new Table({
      el: 'specialimsTable', // String
      messageLabelId: 'message', // String
      model: Specialism, // String
      collection: new SpecialismCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/doctor/image/list', // String
        save: BASE_URL + 'admin/branch/image/save', // String
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
        save200: 'Imágenes actualizados',
      },
      serverKeys: ['id', 'alt', 'url'],
      row: {
        table: ['id', 'alt', 'url'],
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
            key: 'alt',
          },
        ],
        buttons: [
          {
            type: 'i',
            operation: 'file-select',
            class: 'fa-search',
            styles: 'padding-left: 15px;',
          },
          {
            type: 'i',
            operation: 'file-upload',
            class: 'fa-cloud-upload',
            styles: 'padding-left: 15px;',
          },
          {
            type: 'i',
            operation: 'file-view',
            class: 'fa-picture-o',
            styles: 'padding-left: 15px;',
          },
        ],
      },
      upload: {
        path: null,
        inputFile: 'fileImage', // String
        service: {
          url: BASE_URL + 'upload/file',
          formDataKey: 'file',
          uploadMessage: 'Subiendo archivo...',
          errorMessage: 'Ocurrió un error en subir el archivo',
          successMessage: 'Carga completada'
        },
        keyModel: 'url',
        extensions: {
          allow: ['image/jpeg', 'image/png'],
          message: 'Archivo no es de la extensión permitida',
        },
        size: {
          allow: 500000, // bytes
          message: 'Archivo supera el máximo permitido (0.5MB)',
        },
      }
    });
  },
  // ???
  setComponentsData: function(){
    var _this = this;
    this.upload.path = this.branch.get('image');
    this.upload.url = STATIC_URL;
    this.specialimsTable.services.list = BASE_URL + 'admin/branch/image/list?id=' + this.branch.get('id');
    this.specialimsTable.list();
    this.specialimsTable.extraData = {
      branch_id: this.branch.get('id'),
    };
  },
  unSetComponentsData: function(){
    this.upload.path = null;
    this.upload.url = STATIC_URL;
  },
  save: function(){
    this.form.check();
    if(this.form.isOk == true){
      var _this = this;
      this.dentist.set('name', $('#txtName').val());
      this.dentist.set('cop', $('#txtCop').val());
      this.dentist.set('rne', $('#txtRne').val());
      this.dentist.set('image', _this.upload.path);
      var respData = DentistService.saveDetail(this.branch, 'message');
      if(respData.status == 200){
        if(respData.message == ''){
          // is a edited
        }else{
          // is a created, change title and set modelId
          this.branch.set('id', respData.message);
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