Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application) ->
    Ember.SimpleAuth.Session.reopen

      +computed user_id
      user: ->
        user_id = @get('user_id')
        if (!Ember.isEmpty(user_id))
          return container.lookup('store:main').find('user', user_id)

    container.register('app:authenticators:custom', App.CustomAuthenticator)
    Ember.SimpleAuth.setup(container, application)
