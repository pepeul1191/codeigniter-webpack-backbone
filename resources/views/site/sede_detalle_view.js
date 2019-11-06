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
    // map
    var features = [];
    console.log(data);
    console.log(data.detail);
    var longitude = data.detail.longitude;
    var latitude = data.detail.latitude;
    this.map = new Map({
      target: 'map',
      layers: [
        new TileLayer({
          source: new OSM()
        })
      ],
      view: new View({
        center: fromLonLat([longitude, latitude]),
        zoom: 15
      })
    });
    // icon
    var iconStyle = new Style({
      image: new Icon(({
          anchor: [0.5, 1],
          src: STATIC_URL + 'assets/img/marker.png',
      }))
    });
    var iconFeature = new Feature({
      geometry: new Point(fromLonLat([longitude, latitude]))
    });
    iconFeature.setStyle(iconStyle);
    features.push(iconFeature);
    // marker
    var layer = new VectorLayer({
      source: new Vector({
        features: features,
      })
    });
    this.map.addLayer(layer);
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
          resp = JSON.parse(data);
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