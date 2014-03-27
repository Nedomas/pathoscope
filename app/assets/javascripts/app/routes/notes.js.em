PathoscopeApp.DoneNotesRoute = Ember.Route.ext***REMOVED***
  model: ->
    @store.createRecord 'note',
      item: @modelFor('done')
