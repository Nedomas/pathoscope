App.WorldController = Ember.ObjectController.ext***REMOVED***

  +computed model.@each.siblings
  base_nodes: ->
    model = @get('model')

    @get('model.siblings').forEach (sibling) ->
      if model.id == sibling.id
        sibling.set('open', true)

  ***REMOVED*** @get('model.siblings').sortBy 'open'

  actions:
    toggleLi: (param) ->
      alert('got the li' + param)
      @transitionToRoute('world', param)

  ***REMOVED*** setToggleLink: (param) ->
  ***REMOVED***   alert('toggle link')

  ***REMOVED*** setTogglePath: (param) ->
  ***REMOVED***   alert('toggle path')

  ***REMOVED*** wordWasSelected: (param) ->
  ***REMOVED***   console.log('transitioning to', param)
  ***REMOVED***   @transitionToRoute('world', param)
