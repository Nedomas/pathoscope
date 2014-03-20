App.ApplicationRoute = Ember.Route.ext***REMOVED***
  actions:
    sessionAuthenticationSucceeded: ->
      @flashMessage('You have successfully signed in.')
      @transitionTo('tag')
    sessionAuthenticationFailed: ->
      @flashMessage('The password is invalid.').now()
