class App.PathsRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @store.find('path')

  setupController: (controller, model) ->
#   ***REMOVED*** set chosen flags
#     get('session.user.user_paths').forEach (user_path) ->
#       model.forEach (path) ->
#         if user_path.get('path') == path
#           path.set('chosen', true)
#
  ***REMOVED*** Find saved paths
    saved_paths = model.filter (path) ->
      !path.get('isNew')

    controller.set('model', saved_paths)

class App.PathsNewRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @store.createRecord 'path'
