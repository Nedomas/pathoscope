App.DoneController = Ember.ObjectController.ext***REMOVED***
  needs: 'application'

  actions:
    postAction: (param) ->
      note = @get('model')

      @get('controllers.application.current_user').then (user) ->
        note.set('user', user)
        note.save()
        console.log('haaaaaaaaaaaaaaaaa')
