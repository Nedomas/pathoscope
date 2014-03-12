App.TreeNodeComponent = Ember.Component.ext***REMOVED***
  childrenExpanded: false
  notesExpanded: false

  actions:
    nodeChildrenAction: (param) ->
    ***REMOVED*** console.log('nodeChildrenAction')
    ***REMOVED*** @set('notesExpanded', false)
    ***REMOVED*** @toggleProperty('childrenExpanded')
      @s***REMOVED***Action('s***REMOVED***NodeChildren', param)
    nodeNotesAction: (param) ->
    ***REMOVED*** console.log('nodeNotesAction')
    ***REMOVED*** @toggleProperty('notesExpanded')
      @s***REMOVED***Action('s***REMOVED***NodeNotes', param)
    nodePostAction: (param) ->
    ***REMOVED*** console.log('nodePostAction')
    ***REMOVED*** @toggleProperty('notesExpanded')
      @s***REMOVED***Action('s***REMOVED***NodePost', param)
