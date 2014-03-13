# App.register('controller:session', App.SessionsControlle
App.TagRoute = Ember.Route.ext***REMOVED***
  model: ->
    result = Em.A()
    store = @store

    @get('authenticator.currentSession.user.path_ids').forEach (path_id) ->
      path = store.find('path', path_id)
      result.pushObject(path)

    result
