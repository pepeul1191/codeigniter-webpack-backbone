var SiteContactoView = Backbone.View.extend({
  el: 'footer',
  rendered: null,
	initialize: function(){
    this.rendered = false;
	},
	events: {
    'click #terminosCondiciones': 'terminosCondiciones',
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
  },
  terminosCondiciones: function(){
    $('#modalBottom').empty();
    $('#modalBottom').css('max-height', '75%');
    var template = null;
    $.ajax({
      url: STATIC_URL + 'templates/site/terminos_y_condiciones.html',
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
});

export default SiteContactoView;