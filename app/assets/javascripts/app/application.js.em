#= require_tree ../v***REMOVED***or
#= require_self
#= require ./app

window.App = Ember.Application.create
  rootElement: '#pathoscope-container'
  Resolver: Ember.DefaultResolver.ext***REMOVED***
    resolveTemplate: (parsedName) ->
      parsedName.fullNameWithoutType = "app/" + parsedName.fullNameWithoutType
      @._super(parsedName)
