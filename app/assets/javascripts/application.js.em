#= require jquery
#= require lodash.min
#= require underscore.string.min
#= require md5.min
#= require handlebars
#= require ember
#= require ember-data-beta6
#= require_tree ./v***REMOVED***or
#= require_self
#= require app

window.App = Ember.Application.create
  LOG_TRANSITION: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true
  rootElement: '#ember-container'
  deviseSimpleAuth:
  ***REMOVED*** the URL users will see in the browser for the sign in page
    signInPath: "/login"

Handlebars.registerHelper "log", (context) ->
  console.log(context)
