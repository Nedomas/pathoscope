# App.register('controller:session', App.SessionsControlle
App.TagRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.find('user', @get('authenticator.currentSession.user.id')).then (user) ->
      user.get('paths')
