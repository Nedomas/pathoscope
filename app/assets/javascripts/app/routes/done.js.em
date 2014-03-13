App.DoneRoute = Ember.Route.ext***REMOVED***
  model: ->
    debugger
    @store.find('item').then (items) ->
      items.findBy('wasTagged', true)

  ***REMOVED*** @modelFor('done')

***REMOVED*** afterModel: ->
***REMOVED***   @transitionTo('done.index', @modelFor('done'))

App.DoneIndexRoute = Ember.Route.ext***REMOVED***
  model: ->
    @modelFor('done')

  ***REMOVED*** item = @modelFor('done')
  ***REMOVED*** @store.find(item, item.get('id'))
  ***REMOVED*** # console.log @modelFor('done').get('id')
  ***REMOVED*** debugger
  ***REMOVED*** @modelFor('done')
  ***REMOVED*** console.log 'oooo'
  ***REMOVED*** @modelFor('done').filter
  ***REMOVED*** Ember.RSVP.hash
  ***REMOVED***   current_item: @modelFor('done')
  ***REMOVED***   tagged_item: @store.filter 'item', (item) ->
  ***REMOVED***     item.creation_path_id
***REMOVED*** setupController: (controller, model) ->
***REMOVED***   controller.set 'model', Ember.RSVP.hash
***REMOVED***     current_item: @modelFor('done')
***REMOVED***     tagged_item: @store.filter 'item', (item) ->
***REMOVED***       item.creation_path_id

    ***REMOVED*** user_paths: @store.find('user_path')
    ***REMOVED*** users: @store.find('user')
  ***REMOVED*** @store.find('item', 2)
***REMOVED*** model: (params) ->
***REMOVED***   @store.find('item', params.item_id)
