mixin window.Tree
  +computed
  childrenExpanded: ->
    true

  +computed this
  route: ->
    if this.toString()?.match(/Map/)
      'map'
    else if this.toString()?.match(/World/)
      'world'
    else if this.toString()?.match(/Done/)
      'done'

  notesExpandedList: Ember.A()

  actions:
    upAction: (item_id) ->
      @transitionToRoute(@get('route'), item_id)
      false

    childrenAction: (item_id) ->
      if @get('model.id') == item_id
        @toggleProperty('childrenExpanded')
      else
        @set('childrenExpanded', true)
        @transitionToRoute(@get('route'), item_id)
      false

    notesAction: (item_id) ->
      expanded_list = @get('notesExpandedList')

      if expanded_list.contains(item_id)
        expanded_list.popObject(item_id)
      else
        expanded_list.pushObject(item_id)

      false

