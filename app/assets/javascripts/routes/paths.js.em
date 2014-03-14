App.PathsRoute = Ember.Route.ext***REMOVED***
  skipsAuthentification: true

  setupController: (controller, model) ->
    @store.findAll('path').then (paths) ->
      saved_paths = paths.filter (path) ->
        !path.get('isNew')

      controller.set('model', saved_paths)

App.PathsNewRoute = Ember.Route.ext***REMOVED***
  skipsAuthentification: true

  model: ->
    console.log('ha')
    @store.createRecord 'path'
