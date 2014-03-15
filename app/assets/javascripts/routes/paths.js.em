class App.PathsRoute ext***REMOVED***s Ember.Route with ForceAuth
  setupController: (controller, model) ->
    @store.findAll('path').then (paths) ->
      saved_paths = paths.filter (path) ->
        !path.get('isNew')

      controller.set('model', saved_paths)

App.PathsNewRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.createRecord 'path'
