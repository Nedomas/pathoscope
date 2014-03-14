# App.MapNotesController = Ember.ObjectController.ext***REMOVED***
#   needs: 'item'
#
#   init: ->
#     debugger
#     @transitionToRoute('notes.new', @get('model'))
#
***REMOVED*** init: ->
***REMOVED***   @get('controllers.item').set('notesExpanded', true)
***REMOVED***   false
  ***REMOVED*** @get('parentController').set('notesExpanded', true)

App.NotesNewController = Ember.ObjectController.ext***REMOVED***
  needs: ['application', 'item']
  placeholder: 'What do you think about this?'

***REMOVED*** init: ->
***REMOVED***   debugger
***REMOVED***   @get('controllers.item').set('notesExpanded', true)
***REMOVED***   false

  +computed model
  new_note: ->
    @store.createRecord 'note',
      content: '',
      item: @get('model')

  actions:
    postAction: ->
      new_note = @get('new_note')
      self = this

      @get('controllers.application.current_user').then (user) ->
        new_note.set('user', user)
        new_note.save()

      false
      ***REMOVED*** self.transitionToRoute('paths')

      ***REMOVED*** transitionToSelf = ->
      ***REMOVED***   item = new_note.get('item')
      ***REMOVED***   self.transitionToRoute('map.note', item)

