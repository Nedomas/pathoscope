#= require ./store
#= require_tree ../v***REMOVED***or
#= require_tree ../initializers
#= require_tree ../models
#= require_tree ../mixins
#= require_tree ./controllers
#= require ../controllers/application_controller
#= require ../controllers/item_controller
#= require ../controllers/notes_controller
#= require ../controllers/world_controller
#= require_tree ./views
#= require_tree ../components
#= require_tree ./components
#= require_tree ./templates
#= require_tree ../templates/components
#= require ../templates/session
#= require ../templates/item
#= require ../templates/notes
#= require_tree ../templates/notes
#= require_tree ./routes
#= require ./router
#= require_self

# move components to app/components
_.each Ember.TEMPLATES, (template, key) ->
  if !key.match(/app\//)
    Ember.TEMPLATES['app/' + key] = template
    delete Ember.TEMPLATES[key]
