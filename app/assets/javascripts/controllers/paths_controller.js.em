class PS.Web.PathsController ext***REMOVED***s PS.ArrayController
  sortProperties: ['title']
  sortAsc***REMOVED***ing: true

  actions:
    choose: (path) ->
      _this = this

      @get('session.user').then (user) ->
        _this.transitionToRoute('expertise', path.get('id'))

class PS.Web.PathsNewController ext***REMOVED***s Ember.ObjectController
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

