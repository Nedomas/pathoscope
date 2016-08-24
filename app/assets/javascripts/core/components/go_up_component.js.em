PS.Core.GoUpComponent = Ember.Component.extend
  actions:
    upAction: (params) ->
      @sendAction('sendNodeUp', params)

