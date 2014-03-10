App.TreeNodeComponent = Ember.Component.ext***REMOVED***
  isExpanded: false

  actions:
    toggleLi: (param) ->
***REMOVED***     @toggleProperty('isExpanded')
***REMOVED***     alert('got the li in node tree', param)
      @s***REMOVED***Action('treeNodeAction', param)
  ***REMOVED*** # wordWasSelected: (param) ->
  ***REMOVED*** #   console.log('tree node action')
  ***REMOVED*** #   @s***REMOVED***Action('word-was-chosen', param)
  ***REMOVED*** setTogglePath: (param) ->
  ***REMOVED***   console.log('yo')
