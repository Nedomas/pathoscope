App.TagRoute = Ember.Route.ext***REMOVED***
  model: ->
    debugger
    @store.find('user', @get('authenticator.currentSession.user.id')).then (user) ->
      user.get('paths')
