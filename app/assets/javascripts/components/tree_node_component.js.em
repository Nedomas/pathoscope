App.TreeNodeComponent = Ember.Component.ext***REMOVED***
  isExpanded: false

  actions:
    wordWasSelected: (param) ->
    ***REMOVED*** alert('in tree node')
      @toggleProperty('isExpanded')
      @s***REMOVED***Action('word-was-chosen', param)
    ***REMOVED*** @s***REMOVED***Action('toggle', @get('param'))
