App.WorldController = Ember.ArrayController.ext***REMOVED***
  +computed parent
  paths_as_world: ->
    @store.filter App.World, {}, (world) ->
      world.get('isRoot')

  +computed parent
  root: ->
    @store.find(App.World, 0)
