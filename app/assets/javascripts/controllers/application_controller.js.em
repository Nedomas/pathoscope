class App.ApplicationController ext***REMOVED***s Ember.Controller
***REMOVED*** current_user: null

#   +computed session
#   current_user_id: ->
#     store = @store
#     _this = this
#
#     Ember.run ->
#       Ember.$.get('/api/v1/credentials/me').then (response) ->
#         Ember.run ->
#           store.find('user', response.user.id).then (user) ->
#             _this.set('current_user', user)
#             _this.set('session.current_user', user)
#
#   +computed current_user_id
#   get_current_user: ->
#     _this = this
#
#     Ember.run ->
#       _this.get('current_user_id').then (id) ->
#         _this.get('current_user')
#
  +computed session.current_user
  current_user_gravatar_url: ->
    'a'
  ***REMOVED*** @get('session.current_user').then (current_user) ->
  ***REMOVED***   console.log(current_user)
  ***REMOVED***   debugger
  ***REMOVED*** @get('get_current_user')
  ***REMOVED*** debugger
  ***REMOVED*** 'http://www.gravatar.com/avatar/' + md5(@get('current_user.email'))

  dropdownOpen: false

  actions:
    toggleDropdown: ->
      @toggleProperty('dropdownOpen')
      false
