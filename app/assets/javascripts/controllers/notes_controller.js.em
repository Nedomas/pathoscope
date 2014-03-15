App.NotesNewController = Ember.ObjectController.ext***REMOVED***
  needs: ['application']
  placeholder: 'What do you think about this?'

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
