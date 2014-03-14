App.MapRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.find('user', @get('authenticator.currentSession.user.id')).then (user) ->
      user.get('user_paths')

App.MapNotesRoute = Ember.Route.ext***REMOVED***
  setupController: (controller, model) ->
    console.log @controllerFor('item').get('notesExpanded')
    @controllerFor('item').set('notesExpanded', true)
    console.log @controllerFor('item').get('notesExpanded')
    console.log('DOOOOOOOOOOOOOOOOOOOOOOOO')

  r***REMOVED***erTemplate: ->
    @r***REMOVED***er(controller: 'notes')
