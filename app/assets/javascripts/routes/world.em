class PS.Web.WorldIndexRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @modelFor('world')
