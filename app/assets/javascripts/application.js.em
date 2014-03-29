#= require lodash.min
#= require underscore.string.min
#= require md5.min
#= require jquery.timeago
#= require ../../../v***REMOVED***or/assets/javascripts/flash-message
#= require ../../../v***REMOVED***or/assets/javascripts/md5.min
#= require ../../../v***REMOVED***or/assets/javascripts/bower_components/ember-simple-auth/ember-simple-auth
#= require ember-google-analytics
#= require ./core/resolver
#= require_self
#= require app

window.PS.Website = PS.Application.create
  childNamespaces: [PS.Core, PS.Web]
  LOG_TRANSITION: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true
  rootElement: '#ember-container'

Handlebars.registerHelper "log", (context) ->
  console.log(context)
