class PathoscopeApp.ApplicationRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.PathoscopeApplicationRouteMixin
  beforeModel: ->
    @get('session.user')

  actions:
    sessionAuthenticationSucceeded: ->
      @flashMessage('You have successfully signed in.')
      @transitionTo('tag')
    sessionAuthenticationFailed: ->
      @flashMessage('The password is invalid.').now()
    sessionInvalidationSucceeded: ->
      @flashMessage('You have successfully signed out.')
      @transitionTo('world', 1)
