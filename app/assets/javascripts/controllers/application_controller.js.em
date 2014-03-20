class App.ApplicationController ext***REMOVED***s Ember.Controller
  +computed session.user_id
  current_user_gravatar_url: ->
  ***REMOVED*** 'a'
  ***REMOVED*** debugger
    debugger
    if @get('session.user')
      return 'a'
  ***REMOVED***   debugger
  ***REMOVED***   email = user.get('email')
  ***REMOVED***   if email
  ***REMOVED***     'http://www.gravatar.com/avatar/' + md5(email)

  dropdownOpen: false

  actions:
    toggleDropdown: ->
      @toggleProperty('dropdownOpen')
      false
