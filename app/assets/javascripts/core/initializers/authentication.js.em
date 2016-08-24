Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application) ->
    # customize the session so that it allows access to the account object
    Ember.SimpleAuth.Session.reopen
      +computed user_id
      user: ->
        user_id = @get('user_id')
        if (!Ember.isEmpty(user_id))
          return container.lookup('store:main').find('user', user_id)
    # register the custom authenticator so the session can find it
    container.register('authenticators:custom', PS.Core.CustomAuthenticator)
    Ember.SimpleAuth.setup(container, application)
