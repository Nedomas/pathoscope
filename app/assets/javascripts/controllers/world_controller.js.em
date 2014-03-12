App.WorldController = Ember.ObjectController.ext***REMOVED***
  needs: 'application'

  +computed model.@each.siblings
  base_items: ->
    model = @get('model')

    @get('model.siblings').forEach (sibling) ->
        if model.id == sibling.id
          sibling.set('open', true)

      ***REMOVED*** # @get('model.siblings').sortBy 'open'

  +computed model, controllers.application.current_user
  new_note: ->
    item = @get('model')
    store = @store

    @get('controllers.application.current_user').then (user) ->
      store.createRecord 'note',
        item: item,
        user: user

  actions:
    worldChildrenAction: (param) ->
    ***REMOVED*** alert('worldChildrenAction' + param)
      @transitionToRoute('world', param)

    worldNotesAction: (param) ->
      console.log('yoooo')

    worldPostNoteAction: ->
      alert('got the note')
      @get('new_note').save()
      console.log('saved')

    ***REMOVED*** alert('it worked!')
    ***REMOVED*** alert('worldChildrenAction' + param)
    ***REMOVED*** @transitionToRoute('world', param)

  ***REMOVED*** setToggleLink: (param) ->
  ***REMOVED***   alert('toggle link')

  ***REMOVED*** setTogglePath: (param) ->
  ***REMOVED***   alert('toggle path')

  ***REMOVED*** wordWasSelected: (param) ->
  ***REMOVED***   console.log('transitioning to', param)
  ***REMOVED***   @transitionToRoute('world', param)
