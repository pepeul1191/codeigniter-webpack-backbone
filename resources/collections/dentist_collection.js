import Dentist from '../models/dentist';

var DentistCollection = Backbone.Collection.extend({
  model: Dentist,
});

export default DentistCollection;
