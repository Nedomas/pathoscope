Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application) ->
    Ember.SimpleAuth.Authenticators.OAuth2.reopen
      serverTokenEndpoint: '/oauth/token'

    Ember.SimpleAuth.Session.reopen
      +computed isAuthenticated
      current_user: ->
        Ember.run ->
          Ember.$.get('/api/v1/credentials/me').then (response) ->
            container.lookup('store:main').find('user', response.user.id)

#       resource_owner_id: null
#
#       +computed isAuthenticated
#       user_id: ->
#         _this = this
#
#         Ember.$.get('/api/v1/credentials/me').then (response) ->
#           _this.set('resource_owner_id', response.user.id)
#
#         @get('resource_owner_id')
#
#       +observer recource_owner_id
#       user: ->
#         user_id = @get('resource_owner_id')
#         debugger
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
