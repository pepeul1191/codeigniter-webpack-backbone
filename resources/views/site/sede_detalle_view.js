var SiteSedeDetalleView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
	},
	events: {

  },
  render: function(branchType, branchName){
    var data = this.getData(branchType, branchName);
    // TODO IF data = null
    var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/site/sede_detalle.html',
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
  getData: function(branchType, branchName){
    var resp = null;
    var branchTypeId = 0;
    if(branchType == 'lima'){
      branchTypeId = 1;
    }else if(branchType == 'provincia'){
      branchTypeId = 2;
    }
    if(branchTypeId == 1 || branchTypeId == 2){
      $.ajax({
        url: BASE_URL + 'sede/buscar?branch_type_id=' + branchTypeId + '&name=' + branchName,
        type: 'GET',
        async: false,
        success: function(data) {
          var respData = JSON.parse(data);
          console.log(respData);
        },
        error: function(xhr, status, error){
          console.error(error);
          console.log(JSON.parse(xhr.responseText));
        }
      });
    }
    return resp;
  },
});

export default SiteSedeDetalleView;