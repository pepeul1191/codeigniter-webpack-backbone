import ValidationForm from '../../libs/validation_form';

var SiteContactoView = Backbone.View.extend({
  el: 'footer',
  rendered: null,
	initialize: function(){
    this.rendered = false;
    this.form = null;
	},
	events: {
    'click #acpetaCondiciones': 'terminosCondiciones',
    'change #leyCheck': 'leyCheck',
    'click #btnEnviar': 'sendForm',
  },
  render: function(){
		var data = {};
    var templateCompiled = null;
    var _this = this;
		$.ajax({
		  url: STATIC_URL + 'templates/site/contacto.html',
		  type: 'GET',
		  async: false,
		  success: function(resource) {
        var template = _.template(resource);
        templateCompiled = template(data);
        _this.rendered = true;
      },
      error: function(xhr, status, error){
        console.error(error);
				console.log(JSON.parse(xhr.responseText));
      }
    });
		this.$el.html(templateCompiled);
  },
  loadComponents: function(){
    this.form = new ValidationForm({
      el: '#form',
      entries: [
        // nombre
        {
          id: 'txtNombre',
          help: 'txtNombreHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar su nombre',
            }, 
          ],
        },
        // apellido
        {
          id: 'txtApellido',
          help: 'txtApellidoHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar su apellido',
            }, 
          ],
        },
        // correo
        {
          id: 'txtCorreo',
          help: 'txtCorreoHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar su correo',
            }, 
            {
              type: 'isEmail',
              message: 'Debe de ingresar un correo válido',
            }, 
          ],
        },
        // dni
        {
          id: 'txtDNI',
          help: 'txtDNIHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de ingresar su DNI',
            }, 
            {
              type: 'customFunction',
              message: 'Debe de ingresar un DNI válido',
              customFunction: function(){
                var resp = false;
                if($('#txtDNI').val().length == 7){
                  var inputDni = $('#txtDNI').val();
                  if(/^\d+$/.test(inputDni)){
                    resp = true;
                    //Number.isInteger(parseInt());
                  }
                }
                return resp;
              },
            }, 
          ],
        },
        // consulta
        {
          id: 'txtConsulta',
          help: 'txtConsultaHelp',
          validations: [
            {
              type: 'notEmpty',
              message: 'Debe de un mensaje',
            }, 
          ],
        },
        // datos personales
        {
          id: 'leyCheck',
          help: 'leyCheckHelp',
          validations: [
            {
              type: 'customFunction',
              message: 'Debe de haber leido y aceptado la Ley de Protección de Datos Personales',
              customFunction: function(){
                var resp = false;
                if($('#leyCheck').is(':checked')){
                  resp = true;
                }
                return resp;
              },
            }, 
          ],
        },
        // condiciones
        {
          id: 'rdnCondiciones',
          help: 'rdnCondicionesHelp',
          validations: [
            {
              type: 'customFunction',
              message: 'Debe de aceptar las condciones',
              customFunction: function(){
                var resp = false;
                if($('#acpetaCondiciones').is(':checked')){
                  resp = true;
                }
                return resp;
              },
            }, 
          ],
        },
      ],
      classes: {
        textDanger: 'text-error',
        inputInvalid: 'input-error',
        textSuccess: 'green accent-4',
      },
      messageForm: 'messageForm',
    });
  },
  terminosCondiciones: function(){
    $('#modalBottom').empty();
    $('#modalBottom').css('max-height', '75%');
    var template = null;
    $.ajax({
      url: STATIC_URL + 'templates/site/_terminos_y_condiciones.html',
      type: 'GET',
      async: false,
      success: function(source) {
        template = source;
      }
    });
    $('#modalBottom').append(template);
    var btnModal = document.getElementById('modal-bottom-btn');
    btnModal.click();
  },
  leyCheck: function(event){
    var checked = event.target.checked;
    if(checked){
      $('#modalBottom').empty();
      $('#modalBottom').css('max-height', '75%');
      var template = null;
      $.ajax({
        url: STATIC_URL + 'templates/site/_ley_de_proteccion.html',
        type: 'GET',
        async: false,
        success: function(source) {
          template = source;
        }
      });
      $('#modalBottom').append(template);
      var btnModal = document.getElementById('modal-bottom-btn');
      btnModal.click();
    }
  },
  sendForm: function(event){
    this.form.check();
    if(this.form.isOk == true){
      alert('=)');
    }
  },
});

export default SiteContactoView;