App.WorldIndexRoute = Ember.Route.ext***REMOVED***
  model: ->
    model = @modelFor('world')

    model.get('siblings').then (sibling) ->
      model.set('current', false)

    model.set('current', true)
  ***REMOVED*** @store.find('item', params)

***REMOVED*** afterModel: (item, transition) ->
***REMOVED***   siblings = item.get('siblings')
***REMOVED***   if siblings
***REMOVED***     siblings.forEach (sibling) ->
***REMOVED***       debugger
***REMOVED***       if item.id == sibling.id
***REMOVED***         sibling.set('current', true)
***REMOVED***       else
***REMOVED***         sibling.set('current', false)
  ***REMOVED*** @store.find('item').then (items) ->
  ***REMOVED***   items.forEach (sibling) ->
  ***REMOVED***     if item.id == sibling.id
  ***REMOVED***       sibling.set('current', true)
  ***REMOVED***     else
  ***REMOVED***       sibling.set('current', false)

***REMOVED*** setupController: (controller, model) ->
***REMOVED***   debugger
***REMOVED***   controller.set('model', {})

# App.WorldsRoute = Ember.Route.ext***REMOVED***
#   model: ->
#     @store.find('item')
***REMOVED*** afterModel: (item, transition) ->
***REMOVED***   @store.find('item').then (items) ->
***REMOVED***     items.forEach (sibling) ->
***REMOVED***       if item.id == sibling.id
***REMOVED***         sibling.set('current', true)
***REMOVED***       else
***REMOVED***         sibling.set('current', false)
