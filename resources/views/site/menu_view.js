var MenuView = Backbone.View.extend({
  el: 'menu',
  rendered: null,
	initialize: function(){
	},
	events: {
    'click .menu': 'menuClick',
  },
  menuClick: function(event){
    var target = event.target;
    if(event.target.tagName == 'I'){
      target = target.parentElement;
    }
    var templateFile = '_' + target.getAttribute('menu') + '.html';
    var data = {};
    var templateCompiled = null;
    $('#modalPopUp').empty();
    $.ajax({
      url: STATIC_URL + 'templates/site/' + templateFile,
      type: 'GET',
      async: false,
      data: {},
      headers: {
        [CSRF_KEY]: CSRF,
      },
      success: function(resource) {
        var template = _.template(resource);
        data.STATIC_URL = STATIC_URL;
        templateCompiled = template(data);
      }
    });
    $('#modalPopUp').html(templateCompiled);
    var btnModal = document.getElementById('modal-popup-btn');
    btnModal.click();
  },
});

export default MenuView;