class App.WorldController ext***REMOVED***s Ember.ObjectController
  +computed
  childrenExpanded: ->
    true

  notesExpandedList: Ember.A()

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

    notesAction: (item_id) ->
      expanded_list = @get('notesExpandedList')

      if expanded_list.contains(item_id)
        expanded_list.popObject(item_id)
      else
        expanded_list.pushObject(item_id)

      false
