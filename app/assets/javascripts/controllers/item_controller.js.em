class App.ItemController ext***REMOVED***s Ember.ObjectController with Tree
  needs: ['application']

  +computed parentController.childrenExpanded
  childrenExpanded: ->
    if @get('parentController.model.id') == @get('model.id')
      @get('parentController.childrenExpanded')
    else
      false

  +computed model.hasChildren
  hasChildren: ->
    @get('model.hasChildren')

  actions:
    notesAction: (param) ->
      @toggleProperty('notesExpanded')
      false
