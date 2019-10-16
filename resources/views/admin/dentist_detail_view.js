import Table from '../../libs/table';
import Upload from '../../libs/upload';
import ValidationForm from '../../libs/validation_form';
import BranchService from '../../services/admin/branch_service';
import Dentist from '../../models/dentist';
import Image from '../../models/image';
import ImageCollection from '../../collections/image_collection';

var AdminDentistDetailView = Backbone.View.extend({
  el: '#workspace',
  system_id: null,
  imagesTable: null,
  upload: null,
  form: null,
  branch: null,
	initialize: function(){
    this.branch = new Branch();
	},
	events: {
    'click #btnSave': 'save',
    'click #btnViewPicture': 'viewPicture',
  },
  render: function(data, type){
    this.branch.set('id', 'E');
    this.branch.set('name', '');
    this.branch.set('address', '');
    this.branch.set('phone', '');
    this.branch.set('whastapp', '');
    this.branch.set('emergency', '');
    this.branch.set('latitude', '');
    this.branch.set('longitude', '');
    this.branch.set('longitude', '');
    this.branch.set('branch_type_id', 'E');
    this.branch.set('director_id', 'E');
    this.branch.set('image', '');
    if(type == 'new'){
      data.model = this.branch;
      data.disabled = false;
      data.message = '';
      data.messageClass = '';
    }else{ // is edit, set model from server
      var respData = branchService.getDetail(data.id);
      if(respData.status == 200){
        this.branch.set('id', data.id);
        this.branch.set('name', respData.message.name);
        this.branch.set('address', respData.message.address);
        this.branch.set('phone', respData.message.phone);
        this.branch.set('whastapp', respData.message.whastapp);
        this.branch.set('emergency', respData.message.emergency);
        this.branch.set('latitude', respData.message.latitude);
        this.branch.set('longitude', respData.message.longitude);
        this.branch.set('branch_type_id', respData.message.branch_type_id);
        this.branch.set('director_id', respData.message.director_id);
        this.branch.set('image', respData.message.image);
        data.model = this.branch;
        data.disabled = false;
        data.message = '';
        data.messageClass = '';
      }else if(respData.status == 404){
        data.message = 'Recurso que busca no encontrado';
        data.messageClass = 'alert-warning';
      }else if(respData.status == 501){
        data.message = 'Ocurrió un error controlado al recuperar los datos de la sede a editar';
      }else{
        data.message = 'Ocurrió un error no controlado al recuperar los datos de la sede a editar';
      }
    }
    data.model = this.branch;
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
              message: 'Debe de ingresar el nombre de la sede',
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
        // address
        {
          id: 'txtAddress',
          help: 'txtAddressHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar la dirección de la sede',
            }, 
          ],
        },
        // phone
        {
          id: 'txtPhone',
          help: 'txtPhoneHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar el teléfono de la sede',
            }, 
          ],
        },
        // whatsapp
        /*
        {
          id: 'txtWhatsapp',
          help: 'txtWhatsappHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar el numéro de WhatsAapp de la sede',
            }, 
          ],
        },
        */
       // emergency
        /*
        {
          id: 'txtEmergency',
          help: 'txtEmergencyHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar el numéro de WhatsAapp de la sede',
            }, 
          ],
        },
        */
        // latitude
        {
          id: 'txtLatitude',
          help: 'txtLatitudeHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar la latitud de la sede',
            }, 
          ],
        },
        // longitude
        {
          id: 'txtLongitude',
          help: 'txtLongitudeHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar la longitud de la sede',
            }, 
          ],
        },
        // director
        {
          id: 'txtDirector',
          help: 'txtDirectorHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar un director',
            }, 
            {
              type: 'customFunction',
              message: 'Debe de seleccionar uno de los doctores ya registrados',
              customFunction: function() {
                var resp = true;
                // TODO
                return resp;
              },
            },
          ],
        },
        // type select
        {
          id: 'slcBranchType',
          help: 'slcBranchTypeHelp',
          validations: [
            {
              type: 'isSelected',
              message: 'Debe de seleccionar el tipo de sede',
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
    this.imageTable = new Table({
      el: 'imageTable', // String
      messageLabelId: 'message', // String
      model: Image, // String
      collection: new ImageCollection(), // Backbone collection
      services: {
        list: BASE_URL + 'admin/branch/image/list', // String
        save: BASE_URL + 'admin/branch/image/save', // String
      },
      extraData: null,
      observer: { // not initialize
      new: [],
      edit: [],
      delete: [],
      },
      messages: {
        list500: 'Ocurrió un error no esperado en listar las imágenes de la sede',
        list501: 'Ocurrió un error en listar las imágenes de la sede',
        list404: 'Recurso no encontrado - listar imágenes de la sede',
        save500: 'Ocurrió un error no esperado en grabar los cambios',
        save501: 'Ocurrió un error en grabar los cambios',
        save404: 'Recurso no encontrado - guardar imágenes de la sede',
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
  imageFileSelect: function(event){
    this.imageTable.fileSelect(event);
  },
  imageFileUpload: function(event){
    this.imageTable.fileUpload(event);
  },
  saveTableImage: function(event){
    this.imageTable.saveTable(event);
  },
  inputTextImage: function(event){
    this.imageTable.keyUpInputText(event);
  },
  imageFileView: function(event){
    this.imageTable.imageFileView(event);
  },
  addRowImage: function(event){
    this.imageTable.addRow(event);
  },
 // ???
  setComponentsData: function(){
    var _this = this;
    this.upload.path = this.branch.get('image');
    this.upload.url = STATIC_URL;
    this.imageTable.services.list = BASE_URL + 'admin/branch/image/list?id=' + this.branch.get('id');
    this.imageTable.list();
    this.imageTable.extraData = {
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
      this.branch.set('name', $('#txtName').val());
      this.branch.set('description', CKEDITOR.instances['detailTxt'].getData());
      this.branch.set('image', _this.upload.path);
      var respData = branchService.saveDetail(this.branch, 'message');
      if(respData.status == 200){
        if(respData.message == ''){
          // is a edited
        }else{
          // is a created, change title and set modelId
          this.branch.set('id', respData.message);
          $('#formTitle').html('Editar sede');
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