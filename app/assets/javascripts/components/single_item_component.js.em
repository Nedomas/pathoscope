App.SingleItemComponent = Ember.Component.ext***REMOVED***
  tagName: 'li'
  classNames: ['box']
  classNameBindings: ['isPath:path:link']
***REMOVED*** childrenExpanded: false
  notes: true
***REMOVED*** notesExpanded: false

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

