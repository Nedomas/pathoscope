class PS.App.InstallController ext***REMOVED***s Ember.ObjectController
  hover: null

  +computed hover
  hovered: ->
    @get('hover')

  actions:
    setHover: (value) ->
      @set('hover', value)
