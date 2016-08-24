class PS.Web.PathsController extends PS.ArrayController
  sortProperties: ['title']
  sortAscending: true

  actions:
    choose: (path) ->
      _this = this

      @get('session.user').then (user) ->
        _this.transitionToRoute('expertise', path.get('id'))

class PS.Web.PathsNewController extends Ember.ObjectController
  needs: ['application', 'paths']
  sortProperties: ['title']
  sortAscending: true

  actions:
    createAction: (param) ->
      path = @get('model')
      _this = this

      path.set('creation_user_id', @get('session.user.id'))

      path.save().then ->
        _this.get('controllers.paths').addObject(path)
        _this.transitionToRoute('paths')

