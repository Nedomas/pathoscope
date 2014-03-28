class PS.Web.MapRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: (params) ->
    @store.find('user_path', params.user_path_id)
