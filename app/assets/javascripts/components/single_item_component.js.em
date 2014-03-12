App.SingleItemComponent = Ember.Component.ext***REMOVED***
  tagName: 'li'
  classNames: ['box']
  classNameBindings: ['isPath:path:link']
  notes: true

  +computed item.hasChildren
  hasChildren: ->
    @get('item.hasChildren')

  +computed item.hasNotes
  hasNotes: ->
    @get('item.hasNotes')

  +computed item.isPath
  isPath: ->
    @get('item.isPath')

  actions:
    itemChildrenAction: (param) ->
    ***REMOVED*** console.log('itemChildrenAction', param)
      @s***REMOVED***Action('s***REMOVED***ItemChildren', param)
    itemNotesAction: (param) ->
    ***REMOVED*** console.log('itemNotesAction', param)
      @s***REMOVED***Action('s***REMOVED***ItemNotes', param)

