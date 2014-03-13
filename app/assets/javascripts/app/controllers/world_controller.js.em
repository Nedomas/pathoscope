App.WorldController = Ember.ObjectController.ext***REMOVED***
  needs: 'application'
  childrenExpanded: true
  notesExpanded: false

  actions:
    doneChildrenAction: (param) ->
      if @get('model.id') == param
        @toggleProperty('childrenExpanded')
      else
        @transitionToRoute('world', param)
      false

  ***REMOVED*** doneNotesAction: (param) ->
  ***REMOVED***   if @get('notesExpanded')
  ***REMOVED***     if @get('model.id') == param
  ***REMOVED***       @transitionToRoute('world.index', param)
  ***REMOVED***       @set('notesExpanded', false)
  ***REMOVED***     else
  ***REMOVED***       @transitionToRoute('world.notes', param)
  ***REMOVED***   else
  ***REMOVED***     @transitionToRoute('done.notes', param)
  ***REMOVED***     @set('notesExpanded', true)
  ***REMOVED***   false

    doneUpAction: (param) ->
      @transitionToRoute('world', param)
      @set('notesExpanded', false)
      false

  ***REMOVED*** postAction: (param) ->
  ***REMOVED***   console.log('out')
  ***REMOVED***   @transitionToRoute('world', param)
