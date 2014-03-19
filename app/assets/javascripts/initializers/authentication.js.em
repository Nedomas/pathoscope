Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application) ->
    Ember.SimpleAuth.Authenticators.OAuth2.reopen
      serverTokenEndpoint: '/oauth/token'

    Ember.SimpleAuth.Session.reopen
      +computed isAuthenticated
      user_id: ->
        new Ember.RSVP.Promise (resolve) ->
          $.get('/api/v1/credentials/me').then (response) ->
            debugger
            resolve(response.user.id)

      +computed user_id
      user: ->
        user_id = @get('user_id')
        debugger
        if _.isNumber(user_id)
          debugger
          container.lookup('store:main').find('user', user_id)

      ***REMOVED*** promise.then (id) ->
      ***REMOVED***   id

    Ember.SimpleAuth.setup(container, application)
