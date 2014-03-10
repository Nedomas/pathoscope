App.WorldRoute = Ember.Route.ext***REMOVED***
  model: (params) ->
    @store.find('world', params.id)

App.WorldsRoute = Ember.Route.ext***REMOVED***
  beforeModel: ->
    @transitionTo('world', 0)
