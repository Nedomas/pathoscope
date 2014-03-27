class PathsRoute ext***REMOVED***s PS.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    debugger
    @store.find('path')

  setupController: (controller, model) ->
  ***REMOVED*** Find saved paths
    saved_paths = model.filter (path) ->
      !path.get('isNew')

    controller.set('model', saved_paths)

class PS.App.PathsNewRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @store.createRecord 'path'
