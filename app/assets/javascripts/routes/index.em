class App.IndexRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  beforeModel: ->
    if @get('session.isAuthenticated')
      @transitionTo('paths')
    else
      @transitionTo('login')
