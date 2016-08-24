PS.Standalone.DoneNotesRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'note',
      item: @modelFor('done')
