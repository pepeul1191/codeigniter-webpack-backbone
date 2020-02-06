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
    var destDOMId = '#row-' + target.getAttribute('menu');
    $('html, body').animate({ 
      scrollTop: $(destDOMId).offset().top - 175
    }, 1000);
  },
});

export default MenuView;