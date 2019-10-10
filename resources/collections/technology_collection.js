import Technology from '../models/technology';

var TechnologyCollection = Backbone.Collection.extend({
  model: Technology,
});

export default TechnologyCollection;
