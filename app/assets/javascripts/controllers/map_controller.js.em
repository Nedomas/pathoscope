App.MapController = Ember.ObjectController.ext***REMOVED***
  childrenExpanded: false
  notesExpanded: false

  actions:
    worldChildrenAction: (param) ->
      if @get('model.id') == param
        @toggleProperty('childrenExpanded')
      else
        @transitionToRoute('world', param)
      false

    mapNotesAction: (param) ->
      if @get('notesExpanded')
        if @get('model.id') == param
          @transitionToRoute('map.index', param)
          @set('notesExpanded', false)
        else
          @transitionToRoute('map.notes', param)
      else
        @transitionToRoute('map.notes', param)
        @set('notesExpanded', true)
      false
