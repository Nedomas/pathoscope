class App.NotesNewController ext***REMOVED***s Ember.ObjectController
  placeholder: 'What do you think about this?'
  needs: ['world']

  +computed model
  new_note: ->
    item = @get('model.content') || @get('model')
    @store.createRecord 'note',
      content: '',
      item: item

  actions:
    postAction: ->
      new_note = @get('new_note')
      self = this

      @get('session.user').then (user) ->
        new_note.set('user', user)
        new_note.save()

      false
