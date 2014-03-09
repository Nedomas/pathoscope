App.PathsController = Ember.ArrayController.ext***REMOVED***
  needs: ['application']
***REMOVED*** +computed model.isLoaded
***REMOVED*** current_user: ->
  ***REMOVED*** @store.metadataFor('current_user')

  +computed item
  paths: ->
    @store.filter App.World, {}, (world) ->
      world.get('isPath')

  +computed parent
  root: ->
    @store.find(App.World, 0)
