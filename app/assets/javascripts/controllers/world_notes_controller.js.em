App.WorldNotesController = Ember.ObjectController.ext***REMOVED***
  actions:
    worldNotesAction: (param) ->
      console.log('out')
      @transitionToRoute('world', param)
