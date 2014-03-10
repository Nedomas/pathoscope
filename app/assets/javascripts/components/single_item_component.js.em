App.SingleItemComponent = Ember.Component.ext***REMOVED***
  tagName: 'li'
  classNames: ['box']
  classNameBindings: ['isPath:path:link']

  +computed item.isPath
  isPath: ->
    @get('item.isPath')

  actions:
    itemChildrenAction: (param) ->
    ***REMOVED*** console.log('itemChildrenAction', param)
      @s***REMOVED***Action('s***REMOVED***ItemChildren', param)

