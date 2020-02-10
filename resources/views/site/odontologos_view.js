var SiteOdontologosView = Backbone.View.extend({
	el: '#workspace',
	page: 1,
	pages: 0,
	step: 12,
	initialize: function(){
	},
	events: {
		'change #slcTipoSede': 'changeTipoSede',
		'click #btnGoBegin': 'goBegin',
		'click #btnGoPrevious': 'goPrevious',
		'click #btnGoNext': 'goNext',
		'click #btnGoLast': 'goLast',
		'click #btnBuscar': 'buscarOdontologos',
  },
  render: function(){
		var data = {
      STATIC_URL: STATIC_URL,
    };
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
			url: BASE_URL + 'especialidad/listar',
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
		this.page = 1;
		this.buscarOdontologos();
	},
	changeTipoSede: function(event){
		var valueSelected = $(event.target).val();
		var resp = {};
		if(valueSelected != 'E'){
			$.ajax({
				type: 'GET',
				url: BASE_URL + 'sede/listar',
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
		}else{
			$('#slcSedes').empty();
		}
	},
	buscarOdontologos: function(){
		var _this = this;
		var resource = `
			<% odontologos.forEach(function(odontologo) { %>
			<div class="col s12 m2 l3">
				<div class="card">
					<div class="card-image">
						<img src="<%= STATIC_URL %><%= odontologo.image %>">
						<span class="card-title"></span>
					</div>
					<div class="card-content">
						<p style="text-align:center; font-weight: 600;"><%= odontologo.name %></p>
						<p style="text-align:center;">RNE: <%= odontologo.rne %></p>
						<p style="text-align:center;">COP: <%= odontologo.cop %></p>
					</div>
				</div>
			</div>
			<% }) %>
			<div class="col s12 m12 l12 pag-buttons">
				<% if (page != 1){ %>
					<i id="btnGoBegin" class="fa fa-angle-double-left footer-icon" aria-hidden="true"></i>
					<i id="btnGoPrevious" class="fa fa-angle-left footer-icon" aria-hidden="true"></i>
				<% } %>
				<label> <%= page %> / <%= pages %> </label>
				<% if (page != pages){ %>
					<i id="btnGoNext" class="fa fa-angle-right footer-icon" aria-hidden="true"></i>
					<i id="btnGoLast" class="fa fa-angle-double-right footer-icon" aria-hidden="true"></i>
				<% } %>
			</div>
		`;
		var resp = this.buscar();
		var template = _.template(resource);
		var templateCompiled = template({
			STATIC_URL: STATIC_URL,
			odontologos: resp.list, 
			pages: resp.pages,
			page: this.page,
		});
		$('#odontologos').empty();
		$('#odontologos').html(templateCompiled);
	},
	goNext: function(){
		this.page = this.page + 1;
		this.buscarOdontologos();
	},
	goPrevious: function(){
		this.page = this.page - 1;
		this.buscarOdontologos();
	},
	goBegin: function(){
		this.page = 1;
		this.buscarOdontologos();
	},
	goLast: function(){
		this.page = this.pages;
		this.buscarOdontologos();
	},
	buscar: function(){
		var _this = this;
		var resp = '';
		$.ajax({
			type: 'GET',
			url: BASE_URL + 'odontologo/buscar',
			data: {
				name: $('#txtNombreBuscar').val(),
				page: _this.page,
				branch_id: $('#slcSedes').val(),
				specialism_id: $('#slcEspeciliades').val(),
				step: _this.step,
			},
			headers: {
				[CSRF_KEY]: CSRF,
			},
			async: false,
			success: function(data){
				resp = JSON.parse(data);
			},
			error: function(xhr, status, error){
				console.error(error);
				resp.message = JSON.parse(xhr.responseText);
				resp.status = xhr.status;
			}
		});
		return resp;
	},
});

export default SiteOdontologosView;