# App.WorldNotesController = Ember.ObjectController.ext***REMOVED***
#   needs: 'application'
#
***REMOVED*** actions:
  ***REMOVED*** worldNotesAction: (param) ->
  ***REMOVED***   console.log('out')
  ***REMOVED***   @transitionToRoute('world.index', param)
  ***REMOVED*** postAction: (param) ->
  ***REMOVED***   note = @get('model')
  ***REMOVED***   self = this

  ***REMOVED***   @get('controllers.application.current_user').then (user) ->
  ***REMOVED***     note.set('user', user)
  ***REMOVED***     note.save().then(transitionToSelf)

  ***REMOVED***     transitionToSelf = (resp) ->
  ***REMOVED***       item = note.get('item')
  ***REMOVED***       console.log item
  ***REMOVED***       self.transitionToRoute('world.notes', item)

  ***REMOVED***     console.log('haaaaaaaaaaaaaaaaa')

    ***REMOVED*** debugger
    ***REMOVED*** console.log('haaaaaaaaaaaaaaaaa')
    ***REMOVED*** console.log(param)
