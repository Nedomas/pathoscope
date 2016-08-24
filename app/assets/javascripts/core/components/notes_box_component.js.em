PS.Core.NotesBoxComponent = Ember.Component.extend
  actions:
    postAction: ->
      @sendAction('sendNotePost')
