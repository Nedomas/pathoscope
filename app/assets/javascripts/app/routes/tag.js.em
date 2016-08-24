class PS.Standalone.TagRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @get('session.user').then (user) ->
      user.get('user_paths')
