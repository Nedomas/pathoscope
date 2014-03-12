App.TreeNodeComponent = Ember.Component.ext***REMOVED***
  childrenExpanded: false
  notesExpanded: false

  actions:
    nodeChildrenAction: (param) ->
    ***REMOVED*** console.log('nodeChildrenAction')
      @set('notesExpanded', false)
      @toggleProperty('childrenExpanded')
      @s***REMOVED***Action('s***REMOVED***NodeChildren', param)
    nodeNotesAction: (param) ->
      console.log('nodeNotesAction')
      @toggleProperty('notesExpanded')
      @s***REMOVED***Action('s***REMOVED***NodeNotes', param)
