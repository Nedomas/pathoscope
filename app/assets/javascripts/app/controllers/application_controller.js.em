App.ApplicationController = Ember.Controller.ext***REMOVED***
  +computed currentSession
  current_user: ->
    @store.find('user', @get('currentSession.user.id'))
