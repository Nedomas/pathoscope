App.WorldController = Ember.ObjectController.ext***REMOVED***
  childrenExpanded: true
  notesExpanded: false

  actions:
    worldChildrenAction: (param) ->
      if @get('model.id') == param
        @toggleProperty('childrenExpanded')
      else
        @transitionToRoute('world', param)
      false

    worldNotesAction: (param) ->
      if @get('notesExpanded')
        if @get('model.id') == param
          @transitionToRoute('world.index', param)
          @set('notesExpanded', false)
        else
          @transitionToRoute('world.notes', param)
      else
        @transitionToRoute('world.notes', param)
        @set('notesExpanded', true)
      false

    worldUpAction: (param) ->
      @transitionToRoute('world.index', param)
      @set('notesExpanded', false)
      false
