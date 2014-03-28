class PS.Web.ApplicationController ext***REMOVED***s Ember.Controller
  +computed session.user.email
  current_user_gravatar_url: ->
    'http://www.gravatar.com/avatar/' + md5(@get('session.user.email'))

  dropdownOpen: false

  actions:
    toggleDropdown: ->
      @toggleProperty('dropdownOpen')
      false
