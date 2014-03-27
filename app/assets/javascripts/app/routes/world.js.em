PathoscopeApp.WorldRoute = Ember.Route.ext***REMOVED***
  model: (params) ->
    @store.find('item', params.item_id)
