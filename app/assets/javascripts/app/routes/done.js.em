App.DoneRoute = Ember.Route.ext***REMOVED***
***REMOVED*** model: (params) ->
***REMOVED***   @store.createRecord 'note',
***REMOVED***     item: @modelFor('done')

  setupController: (controller, model) ->
    new_model = @store.createRecord 'note',
      item: @modelFor('done')
    console.log(new_model.get('item'))
    controller.set('model', new_model)
  ***REMOVED*** @store.find('item', params.tagged_item_id).then (tagged_item) ->
  ***REMOVED***   note = @store.createRecord 'note',
  ***REMOVED***     item: tagged_item

    ***REMOVED*** Ember.RSVP.hash
    ***REMOVED***   tagged_item: tagged_item
    ***REMOVED***   note: note
    ***REMOVED*** item
  ***REMOVED*** current_item = @modelFor('done')
  ***REMOVED*** debugger

  ***REMOVED*** debugger
  ***REMOVED*** @store.find('item').then (items) ->
  ***REMOVED***   items.findBy('wasTagged', true)

  ***REMOVED*** @modelFor('done')

***REMOVED*** afterModel: ->
***REMOVED***   @transitionTo('done.index', @modelFor('done'))

App.WorldRoute = Ember.Route.ext***REMOVED***
  model: (params) ->
    @store.find('item', params.item_id)

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
