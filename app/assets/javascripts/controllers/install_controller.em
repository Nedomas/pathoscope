class PS.Web.InstallController extends Ember.ObjectController
  hover: null

  +computed hover
  hovered: ->
    @get('hover')

  actions:
    setHover: (value) ->
      @set('hover', value)
