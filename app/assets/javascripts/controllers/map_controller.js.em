class App.MapController ext***REMOVED***s Ember.ObjectController
  +computed
  childrenExpanded: ->
    true

  actions:
    childrenAction: (item_id) ->
      if @get('model.id') == item_id
        @toggleProperty('childrenExpanded')
      else
        @set('childrenExpanded', true)
        @transitionToRoute('map', item_id)
      false

