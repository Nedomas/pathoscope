App.ItemController = Ember.ObjectController.ext***REMOVED***
  childrenExpanded: false
  notesExpanded: false

  grandparent: ~>
    @get('parentController.parentController')

  grandgrandparent: ~>
    @get('grandparent.parentController')

  route: ~>
    if @get('grandgrandparent').toString()?.match(/World/)
      'world'
    else
      'map'

  actions:
    notesAction: (param) ->
      @toggleProperty('notesExpanded')
      false

    childrenAction: (item_id) ->
      nested_by_three = @get('grandparent')?.toString()?.match(/Item/)

      if nested_by_three
        @transitionToRoute(@get('route'), item_id)
      else
        @toggleProperty('childrenExpanded')

      false

