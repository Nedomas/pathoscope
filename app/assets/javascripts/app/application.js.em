#= require lodash.min
#= require underscore.string.min
#= require jquery.timeago
#= require ../../../../vendor/assets/javascripts/flash-message
#= require ../../../../vendor/assets/javascripts/bower_components/ember-simple-auth/ember-simple-auth
#= require ../core/resolver
#= require_self
#= require ./app

window.PS.Bookmarklet = PS.Application.create
  childNamespaces: [PS.Core, PS.Standalone]
  rootElement: '#pathoscope-container'
  Resolver: PS.Resolver.extend
    resolveTemplate: (parsedName) ->
      parsedName.fullNameWithoutType = "app/" + parsedName.fullNameWithoutType
      @._super(parsedName)
