App.WorldController = Ember.ArrayController.ext***REMOVED***
  +computed isLoaded
  meta: ->
    'heyy babe' + @store.get('resourceName')

  +computed parent
  paths_as_world: ->
    @store.filter App.World, {}, (world) ->
      world.get('isRoot')

  +computed parent
  root: ->
    @store.find(App.World, 0)
