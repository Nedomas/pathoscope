class PS.Web.PathsRoute extends PS.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @store.find('path')

  setupController: (controller, model) ->
    # Find saved paths
    saved_paths = model.filter (path) ->
      !path.get('isNew')

    controller.set('model', saved_paths)

class PS.Web.PathsNewRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @store.createRecord 'path'
