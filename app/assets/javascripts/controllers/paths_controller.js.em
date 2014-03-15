App.PathsController = Ember.ArrayController.ext***REMOVED***
  needs: ['application']
  sortProperties: ['title']
  sortAsc***REMOVED***ing: true

  actions:
    choose: (path) ->
      self = this

      @get('controllers.application.current_user').then (user) ->
        user_path = self.store.createRecord 'user_path',
          user: user,
          path: path

        user_path.save().then ->
          self.transitionToRoute('map', user_path.get('id'))

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

