class PS.Web.ExploreRoute ext***REMOVED***s Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  beforeModel: ->
    if @get('session.isAuthenticated')
      last_item_id = @get('session.user.last_item_id')
      if last_item_id
        @transitionTo('world', @get('session.user.last_item_id'))
      else
        @transitionTo('paths')
    else
      @transitionTo('login')
