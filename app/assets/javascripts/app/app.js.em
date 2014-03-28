#= require ./store
#= require_tree ../core/initializers
#= require_tree ../core/models
#= require_tree ./models
#= require_tree ../core/mixins
#= require_tree ../core/controllers
#= require_tree ./controllers
#= require ../controllers/login_controller
#= require_tree ./views
#= require_tree ../core/components
#= require_tree ./components
#= require_tree ./templates
#= require_tree ../templates/components
#= require ../templates/login
#= require ../templates/item
#= require ../templates/notes
#= require_tree ../templates/notes
#= require_tree ./routes
#= require ./router
#= require ../core/authenticator
#= require_self

# move components to app/components
_ps.each Ember.TEMPLATES, (template, key) ->
  if !key.match(/app\//)
    Ember.TEMPLATES['app/' + key] = template
    delete Ember.TEMPLATES[key]
