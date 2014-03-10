App.ApplicationController = Ember.Controller.ext***REMOVED***

  +computed
  current_user: ->
    @get('currentSession.user')

  +computed current_user
  current_user_gravatar_url: ->
    'http://www.gravatar.com/avatar/' + md5(@get('current_user.email'))
