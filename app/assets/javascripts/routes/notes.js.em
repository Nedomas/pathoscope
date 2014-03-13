App.WorldNotesRoute = Ember.Route.ext***REMOVED***
  skipsAuthentification: true

  model: ->
    @store.createRecord 'note',
      item: @modelFor('world')

***REMOVED*** afterModel: (notes, transition) ->
***REMOVED***   world = @modelFor('world')
***REMOVED***   console.log('AFTER')

***REMOVED***   notes.forEach (note) ->
***REMOVED***   ***REMOVED*** debugger
***REMOVED***     if model.id == 1
***REMOVED***       sibling.set('current', true)
