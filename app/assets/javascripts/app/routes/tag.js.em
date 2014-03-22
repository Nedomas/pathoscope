class App.TagRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @get('session.user')

  setupController: (container, model) ->
    debugger
