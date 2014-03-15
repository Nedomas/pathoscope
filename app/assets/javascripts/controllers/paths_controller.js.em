App.PathsController = Ember.ArrayController.ext***REMOVED***
  needs: ['application']
  sortProperties: ['title']
  sortAsc***REMOVED***ing: true

App.PathsNewController = Ember.ObjectController.ext***REMOVED***
  needs: ['application', 'paths']
  sortProperties: ['title']
  sortAsc***REMOVED***ing: true

  actions:
    createAction: (param) ->
      path = @get('model')
      self = this

      @get('controllers.application.current_user').then (user) ->
        path.set('creation_user_id', user.get('id'))

        path.save().then ->
          self.get('controllers.paths').addObject(path)
          self.transitionToRoute('paths')
