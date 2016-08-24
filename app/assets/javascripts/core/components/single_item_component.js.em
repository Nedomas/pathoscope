PS.Core.SingleItemComponent = Ember.Component.extend
  tagName: 'li'
  classNames: ['box']
  classNameBindings: ['isPath:path:link']
  notes: true

  +computed item.hasNotes
  hasNotes: ->
    @get('item.hasNotes')

  +computed item.isPath
  isPath: ->
    @get('item.isPath')

  actions:
    itemChildrenAction: (param) ->
      @sendAction('sendItemChildren', param)
    itemNotesAction: (param) ->
      @sendAction('sendItemNotes', param)

