var AdminRouter = Backbone.Router.extend({
  homeView: null,
  initialize: function() {
  },
  routes:{
    '': 'index',
    // others
    '*path' : 'default',
  },
  index: function(){
    console.log('xxxxxxxxxxxxxxxxxxxxx');
  },
  default: function(path){
    // console.log(path);
    var newURL = '/' + path;
    window.location = newURL;
  },
});

export default AdminRouter;