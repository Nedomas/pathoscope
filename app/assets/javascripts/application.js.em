#= require jquery
#= require lodash.min
#= require underscore.string.min
#= require md5.min
#= require jquery.timeago
#= require handlebars
#= require ember
#= require ember-data-beta6
#= require_tree ../../../v***REMOVED***or/assets/javascripts
#= require_self
#= require app

window.App = Ember.Application.create
  LOG_TRANSITION: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true
  rootElement: '#ember-container'
***REMOVED*** deviseSimpleAuth:
***REMOVED*** ***REMOVED*** the URL users will see in the browser for the sign in page
***REMOVED***   signInPath: "/sign_in"
***REMOVED***   signOutPath: "/sign_out"

Handlebars.registerHelper "log", (context) ->
  console.log(context)
