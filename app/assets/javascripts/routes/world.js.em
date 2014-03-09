App.WorldRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.find('world')

App.WorldsRoute = Ember.Route.ext***REMOVED***
  beforeModel: ->
    @transitionTo('world', 0)
