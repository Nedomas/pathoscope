class PS.Web.ApplicationController extends Ember.Controller
  +computed session.user.email
  current_user_gravatar_url: ->
    'https://www.gravatar.com/avatar/' + md5(@get('session.user.email'))

  dropdownOpen: false

  actions:
    toggleDropdown: ->
      @toggleProperty('dropdownOpen')
      false
