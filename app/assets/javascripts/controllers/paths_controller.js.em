App.PathsController = Ember.ArrayController.ext***REMOVED***
  sortProperties: ['title']
  sortAsc***REMOVED***ing: true

  actions:
    choose: (path) ->
      _this = this

      user_path = self.store.createRecord 'user_path',
        user: @get('session.user.id'),
        path: path

      user_path.save().then ->
        _this.transitionToRoute('map', user_path.get('id'))

App.PathsNewController = Ember.ObjectController.ext***REMOVED***
  needs: ['application', 'paths']
  sortProperties: ['title']
  sortAsc***REMOVED***ing: true

  actions:
    createAction: (param) ->
      path = @get('model')
      _this = this

      path.set('creation_user_id', @get('session.user.id'))

      path.save().then ->
        _this.get('controllers.paths').addObject(path)
        _this.transitionToRoute('paths')

