Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application) ->
    Ember.SimpleAuth.Authenticators.OAuth2.reopen
      serverTokenEndpoint: '/oauth/token'

    Ember.SimpleAuth.Session.reopen
      +computed isAuthenticated
      user: ->
        if @get('isAuthenticated')
          new Ember.RSVP.Promise (resolve) ->
            Ember.$.get('/api/v1/credentials/me').then (response) ->
              container.lookup('store:main').find('user', response.user.id).then (user) ->
                resolve(user)

    Ember.SimpleAuth.setup(container, application)
