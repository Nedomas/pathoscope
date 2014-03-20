Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application) ->
    Ember.SimpleAuth.Authenticators.OAuth2.reopen
      serverTokenEndpoint: '/oauth/token'
    ***REMOVED*** makeRequest: (data) ->
    ***REMOVED***   debugger
    ***REMOVED***   data.email = data.username
    ***REMOVED***   return @_super(data)

  ***REMOVED*** Ember.SimpleAuth.Session.reopen
  ***REMOVED***   +computed isAuthenticated
  ***REMOVED***   user_id: ->
  ***REMOVED***     new Ember.RSVP.Promise (resolve) ->
  ***REMOVED***       $.get('/api/v1/credentials/me').then (response) ->
  ***REMOVED***         debugger
  ***REMOVED***         resolve(response.user.id)

  ***REMOVED***   +computed user_id
  ***REMOVED***   user: ->
  ***REMOVED***     user_id = @get('user_id')
  ***REMOVED***   ***REMOVED*** debugger
  ***REMOVED***     if Em.isNone(user_id)
  ***REMOVED***       return null
  ***REMOVED***     else
  ***REMOVED***   ***REMOVED*** if _.isNumber(user_id)
  ***REMOVED***   ***REMOVED***   debugger
  ***REMOVED***       container.lookup('store:main').find('user', user_id)

  ***REMOVED***   ***REMOVED*** promise.then (id) ->
  ***REMOVED***   ***REMOVED***   id

  ***REMOVED*** debugger
    Ember.SimpleAuth.setup(container, application)
