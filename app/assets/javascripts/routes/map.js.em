class App.MapRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    _this = this

  ***REMOVED*** @controllerFor('application').get('get_current_user').then ->
  ***REMOVED***   user = _this.get('session.current_user.user_paths')
  ***REMOVED***   debugger
