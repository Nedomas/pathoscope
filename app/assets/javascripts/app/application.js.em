#= require ../../../../v***REMOVED***or/assets/javascripts/bower_components/jquery/jquery.js
#= require lodash.min
#= require underscore.string.min
#= require md5.min
#= require jquery.timeago
#= require ../../../../v***REMOVED***or/assets/javascripts/bower_components/handlebars/handlebars.js
#= require ../../../../v***REMOVED***or/assets/javascripts/bower_components/ember/ember.js
#= require ../../../../v***REMOVED***or/assets/javascripts/bower_components/ember-data/ember-data.js
#= require ../../../../v***REMOVED***or/assets/javascripts/flash-message
#= require ../../../../v***REMOVED***or/assets/javascripts/md5.min
#= require ../../../../v***REMOVED***or/assets/javascripts/bower_components/ember-simple-auth/ember-simple-auth
#= require ../core/resolver
#= require_self
#= require ./app

window.PS.Bookmarklet = PS.Application.create
  childNamespaces: [PS.Core, PS.Standalone]
  rootElement: '#pathoscope-container'
  Resolver: PS.Resolver.ext***REMOVED***
    resolveTemplate: (parsedName) ->
      parsedName.fullNameWithoutType = "app/" + parsedName.fullNameWithoutType
      @._super(parsedName)
