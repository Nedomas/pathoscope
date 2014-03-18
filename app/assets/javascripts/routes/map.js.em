class App.MapRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @store.find('user', @get('authenticator.currentSession.user.id')).then (user) ->
      user.get('user_paths')
