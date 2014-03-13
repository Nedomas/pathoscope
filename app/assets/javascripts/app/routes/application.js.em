App.ApplicationRoute = Ember.Route.ext***REMOVED***
  actions:
    validSignIn: ->
      @transitionTo("tag")
    invalidSignIn: ->
      @controllerFor('application').set('flash_error', 'The password is invalid')
