mixin window.ForceAuth
  beforeModel: (transition) ->
    if !@get('authenticator.currentSession.user.id')
      @transitionTo('session')
