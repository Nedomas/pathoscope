class PS.Standalone.TagRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
  ***REMOVED*** @get('session.user').then (user) ->
  ***REMOVED***   user.get('user_paths')
