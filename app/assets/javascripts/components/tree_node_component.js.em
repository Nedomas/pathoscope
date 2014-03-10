App.TreeNodeComponent = Ember.Component.ext***REMOVED***
  isExpanded: false

  actions:
    wordWasSelected: (param) ->
      @toggleProperty('isExpanded')
      @s***REMOVED***Action('word-was-chosen', param)
