var SiteOdontologosView = Backbone.View.extend({
  el: '#workspace',
	initialize: function(){
	},
	events: {
		'change #slcTipoSede': 'changeTipoSede',
  },
  render: function(){
		var data = {};
		var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/site/odontologos.html',
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
		var resp = {};
		$.ajax({
			type: 'GET',
			url: BASE_URL + 'admin/specialism/list',
			data: {},
			headers: {
				[CSRF_KEY]: CSRF,
			},
			async: false,
			success: function(data){
				var sedes = JSON.parse(data);
				resp.status = 200;
				$('#slcEspeciliades').empty();
				var option = document.createElement('OPTION');
				option.value = 'E';
				option.text = '';
				document.getElementById('slcEspeciliades').appendChild(option);
				for(var i = 0; i < sedes.length; i++){
					var option = document.createElement('OPTION');
					option.value = sedes[i].id;
					option.text = sedes[i].name;
					document.getElementById('slcEspeciliades').appendChild(option);
				}
			},
			error: function(xhr, status, error){
				console.error(error);
				resp.message = JSON.parse(xhr.responseText);
				resp.status = xhr.status;
			}
		});
	},
	changeTipoSede: function(event){
		var valueSelected = $(event.target).val();
		var resp = {};
		if(valueSelected != 'E'){
			$.ajax({
				type: 'GET',
				url: BASE_URL + 'admin/branch/list',
				data: {
					branch_type_id: valueSelected,
				},
				headers: {
					[CSRF_KEY]: CSRF,
				},
				async: false,
				success: function(data){
					var sedes = JSON.parse(data);
					resp.status = 200;
					$('#slcSedes').empty();
					var option = document.createElement('OPTION');
					option.value = 'E';
					option.text = '';
					document.getElementById('slcSedes').appendChild(option);
					for(var i = 0; i < sedes.length; i++){
						var option = document.createElement('OPTION');
						option.value = sedes[i].id;
						option.text = sedes[i].name;
						document.getElementById('slcSedes').appendChild(option);
					}
					$('#slcSedes').formSelect();
				},
				error: function(xhr, status, error){
					console.error(error);
					resp.message = JSON.parse(xhr.responseText);
					resp.status = xhr.status;
				}
			});
		}
	},
});

export default SiteOdontologosView;