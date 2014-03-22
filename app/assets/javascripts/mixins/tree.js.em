mixin window.Tree
  childrenExpanded: false
  notesExpanded: false

  grandparent: ~>
    @get('parentController.parentController')

  grandgrandparent: ~>
    @get('grandparent.parentController')

  route: ~>
    if @get('grandparent')?.toString()?.match(/Map/)
      'map'
    else
      'world'

  actions:
    notesAction: (param) ->
      @toggleProperty('notesExpanded')
      false

    childrenAction: (item_id) ->
    ***REMOVED*** nested_by_three = @get('grandparent')?.toString()?.match(/Item/)

      if @get('parentController.model.id') == item_id
        @toggleProperty('childrenExpanded')
      else
        @transitionToRoute(@get('route'), item_id)

      false
