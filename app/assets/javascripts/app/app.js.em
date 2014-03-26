#= require ./store
#= require_tree ../initializers
#= require_tree ../models
#= require_tree ../mixins
#= require_tree ./controllers
#= require ../controllers/application_controller
#= require ../controllers/item_controller
#= require ../controllers/dead_item_controller
#= require ../controllers/notes_controller
#= require ../controllers/world_controller
#= require ../controllers/login_controller
#= require_tree ./views
#= require_tree ../components
#= require_tree ./components
#= require_tree ./templates
#= require_tree ../templates/components
#= require ../templates/login
#= require ../templates/item
#= require ../templates/notes
#= require_tree ../templates/notes
#= require_tree ./routes
#= require ./router
#= require ../authenticator
#= require_self

# move components to app/components
_pathoscope.each Ember.TEMPLATES, (template, key) ->
  if !key.match(/app\//)
    Ember.TEMPLATES['app/' + key] = template
    delete Ember.TEMPLATES[key]
