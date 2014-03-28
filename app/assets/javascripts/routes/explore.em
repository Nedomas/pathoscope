class PS.Web.ExploreRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  beforeModel: ->
    if @get('session.isAuthenticated')
      @transitionTo('world', @get('session.user.last_item_id'))
    else
      @transitionTo('login')
