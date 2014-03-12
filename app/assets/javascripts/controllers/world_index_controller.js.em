# App.WorldIndexController = Ember.ObjectController.ext***REMOVED***
#   needs: 'application'
#
***REMOVED*** +computed model.@each.siblings
***REMOVED*** base_items: ->
***REMOVED***   model = @get('model')

***REMOVED***   debugger
***REMOVED***   @get('model.siblings').forEach (sibling) ->
***REMOVED***     if model.id == sibling.id
***REMOVED***       sibling.set('current', true)
***REMOVED***     else
***REMOVED***       sibling.set('current', false)

      ***REMOVED*** # @get('model.siblings').sortBy 'open'
#
#   +computed model, controllers.application.current_user
#   new_note: ->
#     item = @get('model')
#     store = @store
#
#     @get('controllers.application.current_user').then (user) ->
#       store.createRecord 'note',
#         item: item,
#         user: user
#
#   actions:
#     worldChildrenAction: (param) ->
#     ***REMOVED*** alert('worldChildrenAction' + param)
#       @transitionToRoute('world', param)
#
#     worldNotesAction: (param) ->
#       console.log('in')
#       @transitionToRoute('world.notes', param)
#
#     worldPostAction: (param) ->
#       @get('new_note').then (new_note) ->
#         new_note.save()
#         console.log('saved')

App.WorldIndexController = Ember.ObjectController.ext***REMOVED***
    actions:
      worldNotesAction: (param) ->
        console.log('out')
        @transitionToRoute('world', param)

  ***REMOVED*** postNoteAction: ->
  ***REMOVED***   console.log('fuck')

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
