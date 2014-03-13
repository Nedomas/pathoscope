App.MapRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.find('user', @get('authenticator.currentSession.user.id'))
