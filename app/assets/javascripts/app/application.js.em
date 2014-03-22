#= require jquery
#= require lodash.min
#= require underscore.string.min
#= require md5.min
#= require jquery.timeago
#= require handlebars
#= require ember
#= require ember-data-beta6
#= require_tree ../../../../v***REMOVED***or/assets/javascripts
#= require_self
#= require ./app

window.App = Ember.Application.create
  rootElement: '#pathoscope-container'
  Resolver: Ember.DefaultResolver.ext***REMOVED***
    resolveTemplate: (parsedName) ->
      parsedName.fullNameWithoutType = "app/" + parsedName.fullNameWithoutType
      @._super(parsedName)
