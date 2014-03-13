App.ApplicationController = Ember.Controller.ext***REMOVED***

  +computed authenticator
  isLoggedIn: ->
    debugger

  +computed currentSession
  current_user: ->
    @store.find('user', @get('currentSession.user.id'))

  +computed current_user
  current_user_gravatar_url: ->
    'http://www.gravatar.com/avatar/' + md5(@get('current_user.email'))
