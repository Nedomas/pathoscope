App.TreeNodeComponent = Ember.Component.ext***REMOVED***
  isExpanded: false

***REMOVED*** reset: (->
***REMOVED*** ***REMOVED*** @set('isExpanded', fa)
***REMOVED***   console.log('RESET/INIT', @get('isExpanded')))
***REMOVED*** .on('init')

  actions:
    toggle: ->
      @toggleProperty('isExpanded')
    ***REMOVED*** console.log('TOGGLE ACTION', @get('isExpanded'))
