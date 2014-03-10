# App.PathsController = Ember.ArrayController.ext***REMOVED***
#   needs: ['application']
***REMOVED*** +computed model.isLoaded
***REMOVED*** current_user: ->
  ***REMOVED*** @store.metadataFor('current_user')

***REMOVED*** +computed item
***REMOVED*** paths: ->
***REMOVED***   @store.filter App.Path, {}, (world) ->
***REMOVED***     world.get('isPath')

***REMOVED*** +computed parent
***REMOVED*** root: ->
***REMOVED***   @store.find(App.World, 0)
