App.PathsRoute = Ember.Route.ext***REMOVED***
  skipsAuthentification: true

  model: ->
    @store.find('path')
