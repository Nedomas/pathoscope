App.WorldController = Ember.ObjectController.ext***REMOVED***
  actions:
    childrenAction: (param) ->
      if @get('model.id') == param
        @toggleProperty('childrenExpanded')
      else
        @transitionToRoute('world', param)
      false

    worldUpAction: (param) ->
      @transitionToRoute('world.index', param)
      @set('notesExpanded', false)
      false
