import Table from '../../libs/table';
import Upload from '../../libs/upload';
import ValidationForm from '../../libs/validation_form';
import TechnologyService from '../../services/admin/technology_service';
import Technology from '../../models/technology';

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
  },
  setComponentsData: function(){
    var _this = this;
    CKEDITOR.instances['detailTxt'].setData(_this.technology.get('description'));
    this.upload.path = this.technology.get('image');
    this.upload.url = STATIC_URL;
  },
  unSetComponentsData: function(){
    var _this = this;
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
      var respData = TechnologyService.saveDetail(this.technology, 'message');
      if(respData.status == 200){
        if(respData.message == ''){
          // is a edited
        }else{
          // is a created, change title and set modelId
          this.technology.set('id', respData.message);
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