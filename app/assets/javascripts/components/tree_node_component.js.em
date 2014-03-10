App.TreeNodeComponent = Ember.Component.ext***REMOVED***
  isExpanded: false

  actions:
    nodeChildrenAction: (param) ->
    ***REMOVED*** console.log('nodeChildrenAction')
      @toggleProperty('isExpanded')
      @s***REMOVED***Action('s***REMOVED***NodeChildren', param)
