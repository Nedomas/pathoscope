#= require ./store
#= require_tree ../models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ../components
#= require_tree ./components
#= require_tree ./templates
#= require_tree ../templates/components
#= require_tree ./routes
#= require ./router
#= require_self

# move components to app/components
_.each Ember.TEMPLATES, (template, key) ->
  if !key.match(/app\//)
    Ember.TEMPLATES['app/' + key] = template
    delete Ember.TEMPLATES[key]
