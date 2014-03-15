App.WorldController = Ember.ObjectController.ext***REMOVED***
  actions:
    upAction: (item_id) ->
      @transitionToRoute('world', item_id)
      false
