class PS.Web.InstallController ext***REMOVED***s Ember.ObjectController
  hover: null

  +computed hover
  hovered: ->
    @get('hover')

  actions:
    setHover: (value) ->
      @set('hover', value)
