App.WorldRoute = Ember.Route.ext***REMOVED***
  model: (params) ->
    @store.find('world', params.id)
