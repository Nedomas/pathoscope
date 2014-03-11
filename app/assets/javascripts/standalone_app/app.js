
App = Ember.Application.create({
  rootElement: '#pathoscope-container'
});

App.Router.map(function() {
  this.route("index", { path: "/" });
  this.route("list", { path: "/favs" });
});

App.ApplicationController = Ember.Controller.ext***REMOVED***({
    message: 'This is the application template'
});

App.IndexController = Ember.Controller.ext***REMOVED***({
  message: 'Hello! See how index.hbs is evaluated in the context of IndexController'
});

App.ListRoute = Ember.Route.ext***REMOVED***({
  setupController: function(controller) {
    controller.set('content', ['angular.js', 'backbone.js', 'ember.js']);
  }
});

App.ApplicationView = Em.View.ext***REMOVED***({
  templateName: 'standalone_app/application'
});
