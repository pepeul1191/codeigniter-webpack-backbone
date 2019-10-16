import Branch from '../models/branch';

var BranchCollection = Backbone.Collection.extend({
  model: Branch,
});

export default BranchCollection;
