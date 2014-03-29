#= require lodash.min
#= require underscore.string.min
#= require jquery.timeago
#= require ../../../../v***REMOVED***or/assets/javascripts/flash-message
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
