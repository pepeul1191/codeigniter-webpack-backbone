import Table from '../../libs/table';
import Upload from '../../libs/upload';
import ValidationForm from '../../libs/validation_form';
import TechnologyService from '../../services/admin/technology_service';
import Technology from '../../models/technology';
import Image from '../../models/image';
import ImageCollection from '../../collections/image_collection';

var AdminTechnologyDetailView = Backbone.View.extend({
  el: '#workspace',
  system_id: null,
  imagesTable: null,
  upload: null,
  form: null,
  technology: null,
	initialize: function(){
    this.technology = new Technology();
	},
	events: {
    'click #btnSave': 'save',
    'click #btnViewPicture': 'viewPicture',
    // table
    'click #imageTable > tbody > tr > td > i.file-select': 'imageFileSelect',
    'click #imageTable > tbody > tr > td > i.file-upload': 'imageFileUpload',
    'click #imageTable > tbody > tr > td > i.file-view': 'imageFileView',
    'click #imageTable > tfoot > tr > td > button.save-table': 'saveTableImage',
    'keyup #imageTable > tbody > tr > td > input.text': 'inputTextImage',
    'click #imageTable > tfoot > tr > td > button.add-row': 'addRowImage',
    'click #imageTable > tbody > tr > td > i.delete': 'deleteRowImage',
  },
  render: function(data, type){
    this.technology.set('id', 'E');
    this.technology.set('name', '');
    this.technology.set('desription', '');
    this.technology.set('image', '');
    if(type == 'new'){
      data.model = this.technology;
      data.disabled = false;
      data.message = '';
      data.messageClass = '';
    }else{ // is edit, set model from server
      var respData = TechnologyService.getDetail(data.id);
      if(respData.status == 200){
        this.technology.set('id', data.id);
        this.technology.set('name', respData.message.name);
        this.technology.set('description', respData.message.description);
        this.technology.set('image', respData.message.image);
        this.technology.set('url', respData.message.url);
        data.model = this.technology;
        data.disabled = false;
        data.message = '';
        data.messageClass = '';
      }else if(respData.status == 404){
        data.message = 'Recurso que busca no encontrado';
        data.messageClass = 'alert-warning';
      }else if(respData.status == 501){
        data.message = 'Ocurrió un error controlado al recuperar los datos de la tecnología a editar';
      }else{
        data.message = 'Ocurrió un error no controlado al recuperar los datos de la tecnología a editar';
      }
    }
    data.model = this.technology;
    // template
		var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/admin/technology_detail.html',
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
    // editor
    CKEDITOR.replace('detailTxt' , {
      toolbarGroups: [{
          'name': 'basicstyles',
          'groups': ['basicstyles']
        },
        {
          'name': 'paragraph',
          'groups': ['list', ]
        },
      ],
      removeButtons: 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar'
    });
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
        allow: 600000000,
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
              message: 'Debe de ingresar el nombre de la tecnología',
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
        // url
        {
          id: 'txtURL',
          help: 'txtURLHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar una URL',
            }, 
          ],
        },
        // description
        {
          id: 'detailTxt',
          help: 'detailTxtHelp',
          validations: [
            {
              type: 'notEmptyCKEditor',
              message: 'Debe de ingresar la descripción de la tecnología',
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
        list: BASE_URL + 'admin/technology/image/list', // String
        save: BASE_URL + 'admin/technology/image/save', // String
      },
      extraData: null,
      observer: { // not initialize
      new: [],
      edit: [],
      delete: [],
      },
      messages: {
        list500: 'Ocurrió un error no esperado en listar las imágenes de la tecnología',
        list501: 'Ocurrió un error en listar las imágenes de la tecnología',
        list404: 'Recurso no encontrado - listar imágenes de la tecnología',
        save500: 'Ocurrió un error no esperado en grabar los cambios',
        save501: 'Ocurrió un error en grabar los cambios',
        save404: 'Recurso no encontrado - guardar imágenes de la tecnología',
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
          {
            type: 'i',
            operation: 'delete',
            class: 'fa-times',
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
          allow: 500000000, // bytes
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
  deleteRowImage: function(event){
    this.imageTable.deleteRow(event);
  },
 // ???
  setComponentsData: function(){
    var _this = this;
    CKEDITOR.instances['detailTxt'].setData(_this.technology.get('description'));
    this.upload.path = this.technology.get('image');
    this.upload.url = STATIC_URL;
    this.imageTable.services.list = BASE_URL + 'admin/technology/image/list?id=' + this.technology.get('id');
    this.imageTable.list();
    this.imageTable.extraData = {
      technology_id: this.technology.get('id'),
    };
  },
  unSetComponentsData: function(){
    CKEDITOR.instances['detailTxt'].setData('');
    this.upload.path = null;
    this.upload.url = STATIC_URL;
  },
  save: function(){
    this.form.check();
    if(this.form.isOk == true){
      var _this = this;
      this.technology.set('name', $('#txtName').val());
      this.technology.set('description', CKEDITOR.instances['detailTxt'].getData());
      this.technology.set('image', _this.upload.path);
      this.technology.set('url', $('#txtURL').val());
      var respData = TechnologyService.saveDetail(this.technology, 'message');
      if(respData.status == 200){
        if(respData.message == ''){
          // is a edited
        }else{
          // is a created, change title and set modelId
          this.technology.set('id', respData.message);
          this.imageTable.extraData = {
            technology_id: respData.message,
          };
          $('#formTitle').html('Editar Tecnología');
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

export default AdminTechnologyDetailView;