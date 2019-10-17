var Dentist = Backbone.Model.extend({
  initialize : function() {
    this.id = null;
    this.name = null;
    this.cop = null;
    this.rne = null;
    this.image = null;
  },
  unSet: function(){
    this.set('id', 'E');
    this.set('name', null);
    this.set('cop', null);
    this.set('rne', null);
    this.set('image', null);
  },
});

export default Dentist;