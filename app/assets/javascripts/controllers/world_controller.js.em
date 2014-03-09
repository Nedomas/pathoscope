App.WorldController = Ember.ArrayController.ext***REMOVED***
***REMOVED*** isExpanded: false
***REMOVED*** actions:
***REMOVED***   toggle: ->
***REMOVED***     alert('got it')
***REMOVED***   ***REMOVED*** @s***REMOVED***Action()
***REMOVED***     @toggleProperty('isExpanded')

***REMOVED*** toggle: ->
***REMOVED***   alert('got it')
***REMOVED*** ***REMOVED*** @s***REMOVED***Action()
***REMOVED***   @toggleProperty('isExpanded')

  +computed world
  meta: ->
  ***REMOVED*** 'heyy babe' +
  ***REMOVED*** console.log(@store.metadataFor(App.CurrentUser))

    @store.get('meta')
  ***REMOVED*** console.log(@store.typeMapFor(App.World).metadata)

  +computed parent
  paths_as_world: ->
    @store.filter App.World, {}, (world) ->
      world.get('isRoot')

  +computed parent
  root: ->
    @store.find(App.World, 0)
