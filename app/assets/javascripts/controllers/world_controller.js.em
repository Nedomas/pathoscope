App.WorldController = Ember.ObjectController.ext***REMOVED***
  actions:
    wordWasSelected: (param) ->
      @transitionToRoute('world', param)
