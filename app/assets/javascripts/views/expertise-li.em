class App.ExpertiseLiView ext***REMOVED***s Ember.View
  templateName: 'expertise-li-view'
  classNameBindings: ['hover:hover', 'beforeStart:before-start']
  tagName: 'li'
  classNames: ['item']

  +computed controller.before_items.@each, item
  beforeStart: ->
    @get('controller.before_items').contains(@get('item'))

  click: (event) ->
    @get('controller').s***REMOVED***('selectStartAction', @get('item'))
  mouseEnter: ->
    @get('controller').s***REMOVED***('hovered', @get('item'))
    @set('hover', true)
  mouseLeave: ->
    @set('hover', false)
