var Dentist = Backbone.Model.extend({
  initialize : function() {
    this.id = null;
    this.name = null;
    this.cop = null;
    this.rne = null;
    this.image = null;
  },
  unSet: function(){
    this.id = 'E';
    this.name = null;
    this.cop = null;
    this.rne = null;
    this.image = null;
  },
});

export default Dentist;