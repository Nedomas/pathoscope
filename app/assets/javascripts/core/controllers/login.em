class PS.Core.LoginController extends Ember.Controller with Ember.SimpleAuth.LoginControllerMixin
  authenticatorFactory: 'authenticators:custom'
  # actions:
  #   authenticate: ->
  #     debugger
