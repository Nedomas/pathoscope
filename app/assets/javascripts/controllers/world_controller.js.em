class App.WorldController ext***REMOVED***s Ember.ObjectController
  +computed
  childrenExpanded: ->
    true

  actions:
    upAction: (item_id) ->
      @transitionToRoute('world', item_id)
      false

    childrenAction: (item_id) ->
      if @get('model.id') == item_id
        @toggleProperty('childrenExpanded')
      else
        @set('childrenExpanded', true)
        @transitionToRoute('world', item_id)
      false
