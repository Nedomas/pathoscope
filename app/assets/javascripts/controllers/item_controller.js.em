App.ItemController = Ember.ObjectController.ext***REMOVED***
***REMOVED*** notesExpanded: false

  actions:
    notesAction: (param) ->
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
