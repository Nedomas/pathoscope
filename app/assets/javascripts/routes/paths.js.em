class App.PathsRoute ext***REMOVED***s Ember.Route with ForceAuth
  setupController: (controller, model) ->
    self = this
    debugger

  ***REMOVED*** @store.find('user', @get('authenticator.currentSession.user.id')).then (user) ->
  ***REMOVED***   user_paths = user.get('user_paths')

  ***REMOVED***   self.store.findAll('path').then (paths) ->
  ***REMOVED***   ***REMOVED*** Find chosen paths
  ***REMOVED***     user_paths.forEach (user_path) ->
  ***REMOVED***       paths.forEach (path) ->
  ***REMOVED***         if user_path.get('path') == path
  ***REMOVED***           path.set('chosen', true)

  ***REMOVED***   ***REMOVED*** Find saved paths
  ***REMOVED***     saved_paths = paths.filter (path) ->
  ***REMOVED***       !path.get('isNew')

  ***REMOVED***     controller.set('model', saved_paths)

App.PathsNewRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.createRecord 'path'
