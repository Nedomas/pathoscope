App.DoneIndexRoute = Ember.Route.ext***REMOVED***
  model: ->
  ***REMOVED*** item = @modelFor('done')
  ***REMOVED*** @store.find(item, item.get('id'))
  ***REMOVED*** # console.log @modelFor('done').get('id')
  ***REMOVED*** debugger
  ***REMOVED*** @modelFor('done')
    console.log 'oooo'
    console.log @modelFor('done').get('siblings')
  ***REMOVED*** @store.find('item', 2)
***REMOVED*** model: (params) ->
***REMOVED***   @store.find('item', params.item_id)
