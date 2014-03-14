App.UserPathController = Ember.ObjectController.ext***REMOVED***
  childrenExpanded: false

  actions:
    childrenAction: (param) ->
      @toggleProperty('childrenExpanded')
      false
