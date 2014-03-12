App.WorldNotesController = Ember.ObjectController.ext***REMOVED***
  needs: 'application'

  actions:
    worldNotesAction: (param) ->
      console.log('out')
      @transitionToRoute('world.index', param)
    postAction: (param) ->
      note = @get('model')

      @get('controllers.application.current_user').then (user) ->
        note.set('user', user)
        note.save()
        console.log('haaaaaaaaaaaaaaaaa')

    ***REMOVED*** debugger
    ***REMOVED*** console.log('haaaaaaaaaaaaaaaaa')
    ***REMOVED*** console.log(param)
