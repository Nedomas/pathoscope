class App.NotesNewController ext***REMOVED***s Ember.ObjectController
  placeholder: 'What do you think about this?'
  needs: ['world']

  +computed model
  new_note: ->
    @store.createRecord 'note',
      content: '',
      item: @get('model')

  actions:
    postAction: ->
      new_note = @get('new_note')
      self = this

      @get('session.user').then (user) ->
        new_note.set('user', user)
        new_note.save()

      false
