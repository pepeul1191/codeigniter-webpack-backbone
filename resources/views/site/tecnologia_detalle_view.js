import {Map, View} from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import VectorLayer from 'ol/layer/Vector';
import Feature from 'ol/Feature';
import Vector from 'ol/source/Vector';
import {fromLonLat} from 'ol/proj';
import Point from 'ol/geom/Point';
import Style from 'ol/style/Style';
import Icon from 'ol/style/Icon';
import 'ol/ol.css';

var SiteTecnologiaDetalleView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
	},
	events: {
  },
  render: function(technologyURL){
    var data = this.getData(technologyURL);
    data.STATIC_URL = STATIC_URL;
    // TODO IF data = null
    var templateCompiled = null;
		$.ajax({
		  url: STATIC_URL + 'templates/site/tecnologia_detalle.html',
		  type: 'GET',
		  async: false,
		  success: function(resource) {
        var template = _.template(resource);
        data.STATIC_URL = STATIC_URL;
        templateCompiled = template(data);
      },
      error: function(xhr, status, error){
        console.error(error);
				console.log(JSON.parse(xhr.responseText));
      }
		});
    this.$el.html(templateCompiled);
    $('.materialboxed').materialbox();
  },
  loadComponents: function(){

  },
  getData: function(technologyURL){
    var resp = null;
    $.ajax({
      url: BASE_URL + 'tecnologia/buscar?url=' + technologyURL,
      type: 'GET',
      async: false,
      success: function(data) {
        resp = JSON.parse(data);
      },
      error: function(xhr, status, error){
        console.error(error);
        console.log(JSON.parse(xhr.responseText));
      }
    });
    return resp;
  },
});

export default SiteTecnologiaDetalleView;