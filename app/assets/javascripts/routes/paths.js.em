class App.PathsRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  setupController: (controller, model) ->
    self = this

    @get('session.user').then (user) ->
      user_paths = user.get('user_paths')

      self.store.findAll('path').then (paths) ->
      ***REMOVED*** Find chosen paths
        user_paths.forEach (user_path) ->
          paths.forEach (path) ->
            if user_path.get('path') == path
              path.set('chosen', true)

      ***REMOVED*** Find saved paths
        saved_paths = paths.filter (path) ->
          !path.get('isNew')

        controller.set('model', saved_paths)

App.PathsNewRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.createRecord 'path'
