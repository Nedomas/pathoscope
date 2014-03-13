App.ApplicationRoute = Ember.Route.ext***REMOVED***
  actions:
    validSignIn: ->
      @flashMessage('You have successfully signed in.')
      @transitionTo('tag')
    invalidSignIn: ->
      @flashMessage('The password is invalid.').now()
