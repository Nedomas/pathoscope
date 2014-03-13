App.DoneIndexController = Ember.ObjectController.ext***REMOVED***
  childrenExpanded: true
  notesExpanded: false

  actions:
    doneChildrenAction: (param) ->
      if @get('model.id') == param
        @toggleProperty('childrenExpanded')
      else
        @transitionToRoute('done', param)
      false

    doneNotesAction: (param) ->
      if @get('notesExpanded')
        if @get('model.id') == param
          @transitionToRoute('done.index', param)
          @set('notesExpanded', false)
        else
          @transitionToRoute('done.notes', param)
      else
        @transitionToRoute('done.notes', param)
        @set('notesExpanded', true)
      false

    doneUpAction: (param) ->
      @transitionToRoute('done.index', param)
      @set('notesExpanded', false)
      false
