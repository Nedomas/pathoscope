PathoscopeApp.IndexRoute = Ember.Route.ext***REMOVED***
  beforeModel: ->
    if @get('session.isAuthenticated')
      @transitionTo('tag')
    else
      @transitionTo('login')
