class App.IndexRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  beforeModel: ->
    @transitionTo('paths')
