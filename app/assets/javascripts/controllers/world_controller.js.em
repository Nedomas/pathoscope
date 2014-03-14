App.WorldController = Ember.ObjectController.ext***REMOVED***
  actions:
***REMOVED***   childrenAction: (param) ->
***REMOVED***     if @get('model.id') == param
***REMOVED***       @toggleProperty('childrenExpanded')
***REMOVED***     else
***REMOVED***       @transitionToRoute('world', param)
***REMOVED***     false

    upAction: (item_id) ->
      @transitionToRoute('world.index', item_id)
      false
