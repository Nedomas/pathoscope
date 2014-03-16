mixin window.ForceAuth
  nothing: 'hey'
***REMOVED*** beforeModel: (transition) ->
***REMOVED***   if !@get('authenticator.currentSession.user.id')
***REMOVED***     @transitionTo('session')
