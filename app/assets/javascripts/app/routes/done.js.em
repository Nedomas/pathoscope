App.DoneRoute = Ember.Route.ext***REMOVED***
  model: (params) ->
    @store.find('item', params.id)
