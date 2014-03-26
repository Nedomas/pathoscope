class App.ExpertiseRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: (params) ->
    _this = this
    @set('path_id', params.path_id)

    Em.$.getJSON('/api/v1/expertise/road', path_id: params.path_id).then (resp) ->
      _this.store.filter 'item', {}, (item) ->
        resp.path_road.contains(parseInt(item.id))

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('path', @store.find('path', @get('path_id')))