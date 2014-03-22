class App.ItemController ext***REMOVED***s Ember.ObjectController with Tree
  needs: 'application'

  childrenExpanded: ~>
    if @get('parentController.model.id') == @get('model.id')
      true

  +computed model.hasChildren
  hasChildren: ->
    @get('model.hasChildren')

  deadItem: ~>
    @get('controllers.application.currentPath') == 'map.index'
