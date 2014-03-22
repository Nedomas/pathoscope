window._pathoscope = _.noConflict()
Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application) ->
  ***REMOVED*** customize the session so that it allows access to the account object
    Ember.SimpleAuth.Session.reopen
      +computed user_id
      user: ->
        user_id = @get('user_id')
        if (!Ember.isEmpty(user_id))
          return container.lookup('store:main').find('user', user_id)
  ***REMOVED*** register the custom authenticator so the session can find it
    container.register('authenticators:custom', App.CustomAuthenticator)
    Ember.SimpleAuth.setup(container, application)
