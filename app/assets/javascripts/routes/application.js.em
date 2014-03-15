class App.ApplicationRoute ext***REMOVED***s Ember.Route
  actions:
    validSignIn: ->
      @flashMessage('You have successfully signed in.')
      @transitionTo('paths')
    invalidSignIn: ->
      @flashMessage('The password is invalid.').now()
    didSignOut: ->
      @flashMessage('You have successfully signed out.')
      @transitionTo('world', 1)
      location.reload()
