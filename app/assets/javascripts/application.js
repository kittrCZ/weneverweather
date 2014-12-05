//= require jquery-2.1.1.min.js
//= require bootstrap.min.js
//= require handlebars-v2.0.0.js
//= require ember.min.js
//
//= require app
//= require router
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views

App = Ember.Application.create();
App.Router.map(function() {
  this.resource('hi');
});
