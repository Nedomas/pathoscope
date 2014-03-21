class App.PathsRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @store.find('path')

#   setupController: (controller, model) ->
#   ***REMOVED*** set chosen flags
#     get('session.user.user_paths').forEach (user_path) ->
#       model.forEach (path) ->
#         if user_path.get('path') == path
#           path.set('chosen', true)
#
#   ***REMOVED*** Find saved paths
#   ***REMOVED*** saved_paths = model.filter (path) ->
#   ***REMOVED***   !path.get('isNew')
#
#     controller.set('model', model)

App.PathsNewRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.createRecord 'path'
