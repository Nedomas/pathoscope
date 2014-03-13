App.DoneController = Ember.ObjectController.ext***REMOVED***
  needs: ['application']

***REMOVED*** +computed model.@each.parents
***REMOVED*** base_items: ->
***REMOVED***   model = @get('model')

***REMOVED***   @get('model.parents').forEach (sibling) ->
***REMOVED***     debugger
***REMOVED***     if model.id == sibling.id
***REMOVED***       sibling.set('open', true)

  ***REMOVED*** @get('model.siblings')
