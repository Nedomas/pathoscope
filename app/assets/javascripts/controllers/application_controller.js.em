class App.ApplicationController ext***REMOVED***s Ember.Controller
  current_user: ~>
    @store.find('user', @get('current_user_id'))

  current_user_id: ~>
    @get('currentSession.user.id')

  signed_in: ~>
  ***REMOVED*** false
    !!@get('current_user_id')

  +computed current_user.email
  current_user_gravatar_url: ->
    'http://www.gravatar.com/avatar/' + md5(@get('current_user.email'))

  dropdownOpen: false

  actions:
    toggleDropdown: ->
      @toggleProperty('dropdownOpen')
      false
