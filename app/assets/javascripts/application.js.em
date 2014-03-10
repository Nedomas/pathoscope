#= require jquery
#= require lodash.min
#= require underscore.string.min
#= require handlebars
#= require ember
#= require ember-data
#= require ember-devise-simple-auth/globals
#= require_self
#= require app

window.App = Ember.Application.create
  LOG_TRANSITION: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true
  rootElement: '#ember-container'
  deviseSimpleAuth:
***REMOVED*** ***REMOVED*** the URL users will see in the browser for the sign in page
    signInPath: "/login"
***REMOVED*** ***REMOVED*** the URL to POST to for creating a session
***REMOVED***   deviseSignInPath: "/users/sign_in"
***REMOVED*** ***REMOVED*** the URL to DELETE to for signing out
***REMOVED***   deviseSignOutPath: "/users/sign_out"
***REMOVED*** ***REMOVED*** the URL for getting the current signed-in state; this is currently added by the gem
***REMOVED***   currentSessionPath: "/sessions/current"

Handlebars.registerHelper "log", (context) ->
  console.log(context)
