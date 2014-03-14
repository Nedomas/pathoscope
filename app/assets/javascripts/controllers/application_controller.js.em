App.ApplicationController = Ember.Controller.ext***REMOVED***

  +computed authenticator
  isLoggedIn: ->
    debugger

  current_user: ~>
    @store.find('user', @get('current_user_id'))

  current_user_id: ~>
    @get('currentSession.user.id')

  signed_in: ~>
    !!@get('current_user_id')

  +computed current_user
  current_user_gravatar_url: ->
    'http://www.gravatar.com/avatar/' + md5(@get('current_user.email'))
