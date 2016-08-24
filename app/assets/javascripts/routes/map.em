class PS.Web.MapRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: (params) ->
    @store.find('user_path', params.user_path_id)
