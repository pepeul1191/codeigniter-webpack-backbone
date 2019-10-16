var Branch = Backbone.Model.extend({
  initialize : function() {
    this.id = null;
    this.name = null;
    this.address = null;
    this.phone = null;
    this.whatsapp = null;
    this.emergency = null;
    this.image = null;
    this.latitude = null;
    this.longitude = null;
    this.branch_type_id = null;
    this.director_id = null;
  }
});

export default Branch;