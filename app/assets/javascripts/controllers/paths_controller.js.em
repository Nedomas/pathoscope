class PS.App.PathsController ext***REMOVED***s Ember.ArrayController
  sortProperties: ['title']
  sortAsc***REMOVED***ing: true

  actions:
    choose: (path) ->
      _this = this

      @get('session.user').then (user) ->
        user_path = _this.store.createRecord 'user_path',
          user: user,
          path: path

        user_path.save().then ->
          _this.transitionToRoute('expertise', path.get('id'))

class PS.App.PathsNewController ext***REMOVED***s Ember.ObjectController
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

