var SiteHomeView = Backbone.View.extend({
  el: '#workspace',
	initialize: function(){
	},
	events: {
  },
  render: function(){
		var data = {
			STATIC_URL: STATIC_URL,
		};
		var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/site/home.html',
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
  },
});

export default SiteHomeView;