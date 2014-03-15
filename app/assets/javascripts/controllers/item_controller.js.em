class App.ItemController ext***REMOVED***s Ember.ObjectController with Tree
  needs: 'application'

  +computed model.hasChildren
  hasChildren: ->
    @get('model.hasChildren')

  deadItem: ~>
    @get('controllers.application.currentPath') == 'map.index'
