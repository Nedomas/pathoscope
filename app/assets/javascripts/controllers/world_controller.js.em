App.WorldController = Ember.ObjectController.ext***REMOVED***
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
***REMOVED*** isExpanded: false

  actions:
    wordWasSelected: (param) ->
    ***REMOVED*** alert('selected')
    ***REMOVED*** console.log(id)
      @transitionToRoute('world', param)
    ***REMOVED*** alert('randgoggle')
    ***REMOVED*** @set('isExpanded', true)
    ***REMOVED*** console.log('expancding')
    ***REMOVED*** @toggleProperty('isExpanded')
    ***REMOVED*** false


***REMOVED*** +computed world
***REMOVED*** meta: ->
***REMOVED*** ***REMOVED*** 'heyy babe' +
***REMOVED*** ***REMOVED*** console.log(@store.metadataFor(App.CurrentUser))

***REMOVED***   @store.get('meta')
***REMOVED*** ***REMOVED*** console.log(@store.typeMapFor(App.World).metadata)

***REMOVED*** +computed parent
***REMOVED*** paths_as_world: ->
***REMOVED***   @store.filter App.World, {}, (world) ->
***REMOVED***     world.get('isRoot')

***REMOVED*** +computed parent
***REMOVED*** root: ->
***REMOVED***   @store.find(App.World, 0)
