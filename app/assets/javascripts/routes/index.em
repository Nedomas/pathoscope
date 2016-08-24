class PS.Web.IndexRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  beforeModel: ->
    if @get('session.isAuthenticated')
      @transitionTo('paths')
    else
      @transitionTo('login')
