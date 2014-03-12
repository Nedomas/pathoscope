# App.WorldNotesRoute = Ember.Route.ext***REMOVED***
***REMOVED*** model: ->
***REMOVED***   @store.find('note')

***REMOVED*** afterModel: (notes, transition) ->
***REMOVED***   world = @modelFor('world')
***REMOVED***   console.log('AFTER')

***REMOVED***   notes.forEach (note) ->
***REMOVED***   ***REMOVED*** debugger
***REMOVED***     if model.id == 1
***REMOVED***       sibling.set('current', true)
