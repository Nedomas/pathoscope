class App.DeadItemController ext***REMOVED***s Ember.ObjectController with Tree
  hasChildren: false

  actions:
    notesAction: (param) ->
      @toggleProperty('notesExpanded')
      false
