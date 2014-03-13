# App.DoneController = Ember.ObjectController.ext***REMOVED***
***REMOVED*** needs: ['application']

***REMOVED*** +computed model.@each.siblings
***REMOVED*** base_items: ->
***REMOVED***   model = @get('model')

***REMOVED***   @get('model.siblings').forEach (sibling) ->
***REMOVED***       if model.id == sibling.id
***REMOVED***         sibling.set('open', true)

***REMOVED***   @get('model.siblings')
